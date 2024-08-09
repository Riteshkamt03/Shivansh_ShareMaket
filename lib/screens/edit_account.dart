import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/api_service.dart';

class EditAccountPage extends StatefulWidget {
  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  label: 'Name',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null),
              CustomTextField(
                  label: 'Email',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your email' : null),
              CustomTextField(
                  label: 'Phone Number',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your phone number' : null),
              SizedBox(height: 20),
              CustomButton(
                text: 'Update Account',
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle account update logic
                    final response = await _apiService.updateAccount(
                      name: 'John Doe', // Replace with actual input
                      email: 'john.doe@example.com',
                      phone: '1234567890',
                    );
                    if (response) {
                      Navigator.pushNamed(context, '/my_account');
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
