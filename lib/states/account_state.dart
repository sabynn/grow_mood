import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_mood/states/global_state.dart';
import '../models/user_model.dart';

class AccountState {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userReference =  FirebaseFirestore.instance.collection('User');
  final CollectionReference _moodReference = FirebaseFirestore.instance
      .collection('History');
  late String id;
  UserModel? _userModel;

  UserModel? get getUser => _userModel;
  FirebaseAuth? get getAuth => _auth;
  CollectionReference get getUserRef => FirebaseFirestore.instance.collection('User');

  Stream<QuerySnapshot> get getHistory {
    User? user = _auth.currentUser;
    if (user != null) {
      return _moodReference.where('user_id', isEqualTo: _userModel?.id).snapshots();
    } else {
      // Return an empty stream or handle the case where the user is not logged in
      return const Stream.empty();
    }
  }
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
      id = user.id;
      _userModel = user;
      await accountRM.setState((s) {
        s._userModel = user;
        return;
      });
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
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
        name: name,
      );

      await setUser(user);
      _userModel = user;
      await accountRM.setState((s) {
        s._userModel = user;
        return;
      });
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
        name: snapshot['name']
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _userModel = null;
    } catch (e) {
      rethrow;
    }
  }
}
