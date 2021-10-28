import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  static Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> sendResetPasswordEmail(String email) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.sendPasswordResetEmail(email: email);
  }
}
