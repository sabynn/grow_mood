import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AccountState {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

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

      UserModel user = await getUserById(userCredential.user!.uid);
      _userModel = user;
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String username,
    required String email,
    required String password,
    profilePic =
        "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        username: username,
        email: email,
        profilePic: profilePic,
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
        username: snapshot['username'],
        email: snapshot['email'],
        profilePic: snapshot['profilePic'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'username': user.username,
        'profilePic': user.profilePic,
      });
    } catch (e) {
      rethrow;
    }
  }
}
