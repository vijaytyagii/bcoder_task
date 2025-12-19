import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vijay_test1/controllers/explore_controller.dart';
import 'package:vijay_test1/controllers/home_controller.dart';
import 'package:vijay_test1/controllers/sign_in_controller.dart';
import 'package:vijay_test1/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
    ),
  );
  Get.put(SignInController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Jost',
        scaffoldBackgroundColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      // theme: ThemeData(
      //   fontFamily: 'Jost',
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     // iconTheme: IconThemeData(color: Colors.black),
      //     // titleTextStyle: TextStyle(
      //     //   color: Colors.black,
      //     //   fontSize: 18,
      //     //   fontWeight: FontWeight.w600,
      //     // ),
      //   ),
      // ),
      home: SignInScreen(),
    );
  }
}
