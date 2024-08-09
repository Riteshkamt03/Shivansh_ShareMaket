import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/api_service.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();

  // Controllers for each text field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is removed from the widget tree
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Name',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              CustomTextField(
                controller: _dobController,
                label: 'Date of Birth',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your date of birth' : null,
              ),
              CustomTextField(
                controller: _phoneController,
                label: 'Phone Number',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your phone number' : null,
              ),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Create Account',
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    try {
                      // Call the API service to create the account
                      final success = await _apiService.createAccount(
                        name: _nameController.text,
                        dob: _dobController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      // Check response and show success message
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Account created successfully!')),
                        );

                        // Navigate to login page or another page after successful account creation
                        Navigator.pushNamed(context, '/login');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to create account')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('An error occurred: $e')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
