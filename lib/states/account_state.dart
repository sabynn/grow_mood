import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AccountState {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userReference =  FirebaseFirestore.instance.collection('User');

  UserModel? _userModel;

  UserModel? get getUser => _userModel;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(userCredential.user?.getIdToken());

      UserModel user = await getUserById(userCredential.user!.uid);
      _userModel = user;
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
      );

      await setUser(user);
      _userModel = user;
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
      });
    } catch (e) {
      rethrow;
    }
  }
}
