import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/api_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  label: 'Username',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your username' : null),
              CustomTextField(
                  label: 'Password',
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your password' : null),
              SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle login logic
                    final success = await _apiService.login(
                      username: 'testuser', // Replace with actual input
                      password: 'password123',
                    );
                    if (success) {
                      Navigator.pushReplacementNamed(context, '/my_account');
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Handle Google login
                },
                child: Text('Login with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
