import 'package:flutter/material.dart';
import 'package:app_firebase_flutter/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            "Cadastro realizado com sucesso!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.popUntil(context, (page) => page.isFirst),
              child: const Text(
                "Ok",
                style: TextStyle(
                  color: Color(0xFF2D936E),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ignore: prefer_const_constructors
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 60,
            ),
            child: Column(
              children: [
                const Text(
                  "WRK Cursos",
                  style: TextStyle(color: Colors.black54, fontSize: 40),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Register",
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 10,
                        color: Colors.red,
                      ),
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
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 10,
                        color: Colors.red,
                      ),
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
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
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        _authService
                            .registerUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text,
                        )
                            .then(
                          (String? error) {
                            if (error != null) {
                              final snackBar = SnackBar(
                                content: Text(error),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              _showMessage(context);
                            }
                          },
                        );
                      } else {
                        const snackBar = SnackBar(
                          content: Text("As senhas não correspondem!"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF2D936E)),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
