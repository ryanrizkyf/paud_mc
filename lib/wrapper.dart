import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paud_mc/UI/pages/Auth/auth.dart';
import 'package:paud_mc/UI/pages/Dashboard/dashboard.dart';

import 'controllers/controllers.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthC>(
      builder: (controller) {
        return (controller.user != null) ? Dashboard() : LoginPage();
      },
    );
  }
}
