import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../services/api_service.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  late int userId;

  @override
  void initState() {
    super.initState();
    // Extract userId from arguments
    userId = ModalRoute.of(context)!.settings.arguments as int;
    // Fetch user details and initialize the controllers
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    // Fetch user details and set to controllers
    try {
      final user = await _apiService.fetchUserDetails(userId);
      _nameController.text = user.name;
      _emailController.text = user.email;
      _phoneController.text = user.phone;
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load user details: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateAccount() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final success = await _apiService.updateAccount(
          userId: userId,
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
        );

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account updated successfully!'),
            ),
          );
          Navigator.pushNamed(context, '/my_account');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to update account. Please try again.'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Name',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your name'
                    : null,
              ),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your email'
                    : null,
              ),
              CustomTextField(
                controller: _phoneController,
                label: 'Phone Number',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your phone number'
                    : null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Update Account',
                onPressed: _updateAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
