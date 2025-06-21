import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;

  static Future<User?> signIn(String email, String pwd) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
    return cred.user;
  }

  static Future<User?> register(String email, String pwd) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
    return cred.user;
  }

  static Future<void> signOut() => _auth.signOut();
}
