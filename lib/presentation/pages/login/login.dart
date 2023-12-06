import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'MebelApp',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Container(
              child: Image.asset(
                'assets/images/logoo.png',
                width: 500,
                height: 500,
              ),
            ),
            Container(
              width: 200,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 159, 156, 156)),
                onPressed: () {
                  Get.toNamed(AppPage.newRegister);
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 200,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 61, 59, 59)),
                onPressed: () {
                  Get.toNamed(AppPage.userLogin);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
