import 'package:app_firebase_flutter/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "WRK Cursos",
                  style: TextStyle(color: Colors.black54, fontSize: 40),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email or Phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      suffixIcon: const Icon(Icons.visibility_off)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget your Password?",
                        style: TextStyle(
                            color: Color(0xFF2D936E),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF2D936E)),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
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
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont't have account?"),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Color(0xFF2D936E)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
