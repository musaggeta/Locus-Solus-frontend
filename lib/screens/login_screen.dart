import 'package:flutter/material.dart';
import 'package:locus_solus_frontend/widgets/custom_buttom.dart';
import '../widgets/custom_text_field.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    final success = _authService.login(email, password);
    final snackBar = SnackBar(
      content: Text(success ? 'Login exitoso' : 'Credenciales inválidas'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(label: 'Email', controller: _emailController),
            const SizedBox(height: 12),
            CustomTextField(
              label: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            CustomButton(label: 'Iniciar Sesión', onPressed: _login),
          ],
        ),
      ),
    );
  }
}
