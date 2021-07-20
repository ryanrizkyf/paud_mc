part of 'service.dart';

class AuthService {
  static Future<void> signOut() async {
    await auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return print(e.toString());
    }
  }
}