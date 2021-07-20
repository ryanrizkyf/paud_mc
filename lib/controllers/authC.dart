part of 'controllers.dart';

class AuthC extends GetxController {
  late TextEditingController emailController,
      passwordController,
      namaLengkapController,
      noHpController;
  Rxn<User> firebaseUser = Rxn<User>();

  List role = ['Guru', 'Murid'];

  var email = "";
  var password = "";

  User? get user => firebaseUser.value;

  final _selectedRole = "Murid".obs;

  set selectedRole(val) => _selectedRole.value = val;

  get selectedRole => _selectedRole.value;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final _isShowPassword = false.obs;

  set isShowPassword(val) => _isShowPassword.value = val;

  get isShowPassword => _isShowPassword.value;

  final _userModel = UserModel().obs;

  set userModel(value) => _userModel.value = value;

  get userModel => _userModel.value;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());
    emailController = TextEditingController();
    passwordController = TextEditingController();
    namaLengkapController = TextEditingController();
    noHpController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    namaLengkapController.dispose();
    noHpController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Berikan email yang valid";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Kata sandi harus lebih dari 6 karakter";
    }
    return null;
  }

  bool? checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    loginFormKey.currentState!.save();
    return true;
  }

  void showPassword() => isShowPassword = !isShowPassword;

  void clear() => userModel = UserModel();

  void clearData() {
    emailController.clear();
    passwordController.clear();
    namaLengkapController.clear();
    noHpController.clear();
  }

  void createNewUser(UserModel userModel, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: userModel.email!.trim(),
        password: password,
      );

      UserModel users = userCredential.user!.convertToUser(
        userId: userCredential.user!.uid,
        email: userModel.email ?? "",
        namaLengkap: userModel.namaLengkap ?? "",
        role: userModel.role ?? "",
      );

      if (await UserService.createNewUser(users)) {
        print('Add user authentication: ${userCredential.user!.uid}');
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Password sangat lemah');
        Get.snackbar(
            "Password sangat lemah", "password harus lebih dari 6 karakter",
            snackPosition: SnackPosition.TOP);
      } else if (e.code == 'email-already-in-use') {
        print('Akun email sudah ada');
        Get.snackbar("Akun email sudah ada",
            "silahkan daftarkan email yang belum terdaftar",
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("Kesalahan pada saat membuat akun", "${e.toString()}",
          snackPosition: SnackPosition.TOP);
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.find<UserC>().userModel =
          await UserService.getUser(userCredential.user!.uid);
      Get.back();
      print("Login userCredential berhasil: ${userCredential.user!.uid}");
      print("Login user berhasil: ${user!.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Tidak ada user untuk email itu');
        Get.snackbar('Tidak ada user untuk email itu',
            "Silahkan untuk mendaftarkan diri terlebih dahulu",
            snackPosition: SnackPosition.TOP);
      } else if (e.code == 'wrong-password') {
        print('Password salah untuk akun tersebut');
        Get.snackbar(
            'Password salah untuk akun tersebut', 'Pastikan password benar',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Kesalahan pada saat masuk akun", "${e.toString()}",
          snackPosition: SnackPosition.TOP);
    }
  }

  void signOut() async {
    try {
      await AuthService.signOut();
      Get.snackbar('Berhasil keluar akun', 'Anda telah keluar akun',
          snackPosition: SnackPosition.TOP);
      Get.find<UserC>().clear();
      clearData();
      print('clear UserModel active success');
    } catch (e) {
      Get.snackbar("Kesalahan pada saat keluar akun", "${e.toString()}",
          snackPosition: SnackPosition.TOP);
    }
  }

  void resetPassword(String email) async {
    try {
      await AuthService.resetPassword(email);
      Get.snackbar('Berhasil', 'Silahkan cek email Anda $email');
    } catch (e) {
      Get.snackbar('Kesalahan pada saat ubah kata sandi', "${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
