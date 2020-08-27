import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  // auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges();
  }

// anon
  Future signInAnon() async {
    try {
      UserCredential resp = await _auth.signInAnonymously();
      User user = resp.user;
      return user;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
}
// email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    }
    catch(e) {
      print('Registration Error: $e');
      return null;
    }
  }

  // register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    }
    catch(e) {
      print('Registration Error: $e');
      return null;
    }
  }
  // logout
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
}
