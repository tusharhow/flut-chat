import 'package:flut_chat/components/navigate.dart';
import 'package:flut_chat/controllers/auth_controllers.dart';
import 'package:flut_chat/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = Get.put(AuthService());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
           const   SizedBox(height: 20),
              TextFormField(
                controller: authService.phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  enabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
          const    SizedBox(height: 20),
              TextFormField(
                controller: authService.passController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
           const   SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  authService.createUser(
                    authService.passController.text,
                    authService.phoneController.text,
                    context,
                  );
                },
                child: const Text('Sign Up'),
              ),
             const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               const   Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      push(context: context, widget:const LoginScreen());
                    },
                    child: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
