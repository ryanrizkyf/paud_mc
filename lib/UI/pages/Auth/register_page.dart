part of 'auth.dart';

class RegisterPage extends StatelessWidget {
  final authC = Get.find<AuthC>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daftar",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(top: 8, bottom: 16),
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: generateRoleWidgets(context),
                      ),
                    );
                  }),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      controller: authC.namaLengkapController,
                      decoration: InputDecoration(
                        labelText: "Nama Lengkap",
                        hintText: "Nama Lengkap",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 1, color: Colors.grey)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: authC.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 1, color: Colors.grey)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: authC.passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 1, color: Colors.grey)),
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffffbfbf),
                  ),
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    String namaLengkap = authC.namaLengkapController.text;
                    String email = authC.emailController.text;
                    String password = authC.passwordController.text;
                    String role = authC.selectedRole;

                    print(namaLengkap);
                    print(email);
                    print(password);
                    print(role);

                    UserModel userModel = new UserModel(
                      role: role,
                      email: email,
                      namaLengkap: namaLengkap,
                    );

                    authC.createNewUser(userModel, password);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateRoleWidgets(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 2 * 24 - 24) / 2;

    return authC.role
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: authC.selectedRole == e,
              onTap: () {
                authC.selectedRole = e;
              },
            ))
        .toList();
  }
}
