import 'package:auto_control_panel/providers/auth_provider.dart';
import 'package:auto_control_panel/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text;
              String password = passwordController.text;
              if (email.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Informe o E-mail')));
              } else if (password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Informe a Senha')));
              } else {
                authProvider.signUp(email, password).then((sucesso) {
                  if (sucesso) {
                    Navigator.pushReplacementNamed(context, Routes.HOME);
                  }
                });
              }
            },
            child: const Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
