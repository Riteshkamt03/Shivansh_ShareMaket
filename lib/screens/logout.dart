import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logout')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle logout logic here
            Navigator.pushReplacementNamed(context, '/');
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
