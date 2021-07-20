part of 'binding.dart';

class AuthB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthC());
    Get.lazyPut(() => UserC());
  }
}