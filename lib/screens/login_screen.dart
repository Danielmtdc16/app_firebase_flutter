import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "WRK Cursos",
                    style: TextStyle(color: Colors.black54, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Email or Phone number"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("Forget your Password?"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text("Or login with"),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.google,
                          mini: true,
                        ),
                      ),
                      Expanded(
                        child: FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.facebook,
                          mini: true,
                        ),
                      ),
                      Expanded(
                        child: FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.twitter,
                          mini: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
