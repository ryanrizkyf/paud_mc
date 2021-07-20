import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paud_mc/UI/pages/Dashboard/jadwal.dart';
import 'package:paud_mc/UI/pages/Dashboard/tugas.dart';
import 'package:paud_mc/controllers/controllers.dart';
import 'package:paud_mc/service/service.dart';

class Dashboard extends StatelessWidget {
  final authC = Get.find<AuthC>();
  final userC = Get.find<UserC>();

  @override
  Widget build(BuildContext context) {
    return GetX<UserC>(
      init: UserC(),
      initState: (_) async {
        userC.userModel = await UserService.getUser(authC.user!.uid);
      },
      builder: (logic) {
        return (logic.userModel.userId != null)
            ? Container(
                child: SizedBox(
                  width: 360,
                  height: 640,
                  child: Material(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 37,
                        bottom: 255,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 118,
                            child: Material(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xff929292),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 19,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Material(
                                        color: Color(0xffffbfbf),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    SizedBox(width: 21),
                                    Text(
                                      "${userC.userModel.namaLengkap}\nKelas A",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        letterSpacing: 0.13,
                                      ),
                                    ),
                                    SizedBox(width: 21),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: FlutterLogo(size: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: 273,
                            height: 59,
                            child: Text(
                              "Pengumuman:\n> Belajar Daring",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                letterSpacing: 0.26,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            width: 300,
                            height: 36,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 300,
                                  height: 36,
                                  child: Material(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color(0xff929292),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 27,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 273,
                                            height: 36,
                                            child: GestureDetector(
                                              onTap: () => Get.to(Tugas()),
                                              child: Text(
                                                "Tugas ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  letterSpacing: 0.26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            width: 300,
                            height: 36,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 300,
                                  height: 36,
                                  child: Material(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color(0xff929292),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 27,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 273,
                                            height: 36,
                                            child: GestureDetector(
                                              onTap: () => Get.to(Jadwal()),
                                              child: Text(
                                                "Jadwal Pelajaran",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  letterSpacing: 0.26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            child: Text("Logout"),
                            onPressed: () {
                              authC.signOut();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                body: Container(
                  child: Text("Loading"),
                ),
              );
      },
    );
  }
}
