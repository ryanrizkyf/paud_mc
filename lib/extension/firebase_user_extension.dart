part of 'extension.dart';

extension FirebaseUserExtension on User {
  UserModel convertToUser({
    String userId = "",
    String email = "",
    String namaLengkap = "",
    String role = "",
  }) =>
      UserModel(
        userId: uid,
        email: email,
        namaLengkap: namaLengkap,
        role: role,
      );

  Future<UserModel> fromFireStore() async => await UserService.getUser(this.uid);
}
