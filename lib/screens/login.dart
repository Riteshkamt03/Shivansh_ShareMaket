import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: 'Email', // Changed from Username to Email
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              CustomTextField(
                label: 'Password',
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle login logic
                    final success = await _apiService.login(
                      email:
                          'testuser@example.com', // Replace with actual input
                      password: 'password123',
                    );
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/my_account');
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Handle Google login
                },
                child: const Text('Login with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
