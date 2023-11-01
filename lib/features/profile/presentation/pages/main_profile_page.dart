import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cropmaster/features/profile/domain/profile_controller.dart';

class MainProfilePage extends StatefulWidget {
  const MainProfilePage({Key? key}) : super(key: key);

  @override
  State<MainProfilePage> createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    await _profileController.fetchUserDetails();
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/initial_splash');
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 140, 156, 207),
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 140, 156, 207),
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  final userProfile = _profileController.userProfile.value;
                  return Padding(
                    padding:EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              (userProfile.firstName ?? "N/A").toUpperCase(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' ${userProfile.lastName ?? "N/A"}'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Age: ${userProfile.age ?? "N/A"}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '                     Phone: ${userProfile.phone ?? "N/A"}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Country: ${userProfile.country ?? "N/A"}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              '    State: ${userProfile.state ?? "N/A"}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Pincode: ${userProfile.pincode ?? "N/A"}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '    City: ${userProfile.city ?? "N/A"}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              _logout(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
