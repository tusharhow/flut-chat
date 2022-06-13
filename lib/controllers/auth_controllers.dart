import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flut_chat/components/navigate.dart';
import 'package:flut_chat/views/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../views/homepage.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // login
  final TextEditingController logpassController = TextEditingController();
  final TextEditingController logphoneController = TextEditingController();

  // create user and save to cloud firestore
  Future<void> createUser(
      String password, String phone, BuildContext context) async {
    final user = await _auth.createUserWithEmailAndPassword(
      email: phone,
      password: password,
    );

    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(user.user!.uid).set({
      'phone': phone,
      'password': password,
    });
    if (user != null) {
      push(context: context, widget: const LoginScreen());
    } else {
      print('Error');
    }
  }

  Future<void> loginUser(context) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: logphoneController.text,
      password: logpassController.text,
    );
    if (user != null) {
      push(context: context, widget: const HomePage());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', user.user!.uid);
    } else {
      print('Error');
    }
  }

  // logout and clear shared preferences
  Future<void> logout(context) async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    pushRemove(context: context, widget: const LoginScreen());
  }

  // show all users
  Future<void> getUsers() async {
    final firestore = FirebaseFirestore.instance;
    var users = await firestore.collection('users').get();
    for (var element in users.docs) {
      print(users.docs.length);
    }
  }



  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
}
