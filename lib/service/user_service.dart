part of 'service.dart';

class UserService {
  static CollectionReference _userCollection = firebaseFirestore.collection('users');

  static Future<bool> createNewUser(UserModel userModel) async {
    try {
      await _userCollection.doc(userModel.userId).set({
        'userId': userModel.userId,
        'email': userModel.email,
        'namaLengkap': userModel.namaLengkap,
        'role': userModel.role,
      });
      print('User Added or Updated');
      return true;
    } catch (e) {
      print('Failed to add or update user: $e');
      return false;
    }
  }

  static Future<UserModel> getUser(String userId) async {
    DocumentSnapshot snapshot = await _userCollection.doc(userId).get();
    return UserModel(
      userId: userId,
      email: snapshot.get('email'),
      namaLengkap: snapshot.get('namaLengkap'),
      role: snapshot.get('role'),
    );
  }
}