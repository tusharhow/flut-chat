import 'package:flut_chat/controllers/auth_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Get.put(AuthService());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                authService.logout(context);
                Get.back();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(
                        'Item $index',
                        style:const TextStyle(fontSize: 20),
                      
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
