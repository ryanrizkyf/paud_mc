part of 'controllers.dart';

class UserC extends GetxController {
  final _userModel = UserModel().obs;

  set userModel(value) => _userModel.value = value;

  UserModel get userModel => _userModel.value;

  void clear() {
    userModel = UserModel();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
