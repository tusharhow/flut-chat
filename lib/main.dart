import 'package:firebase_core/firebase_core.dart';
import 'package:flut_chat/views/homepage.dart';
import 'package:flut_chat/views/login.dart';
import 'package:flut_chat/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print('Failed to initialize' + e.toString());
  }

  runApp(const MyApp());
 _init();
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('uid');
  if (token != null) {
    Get.offAll(const HomePage());
    print(token);
  } else {
    Get.offAll(const LoginScreen());
    print(token);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
    );
  }
}
