import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logout')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle logout logic
            Navigator.pushReplacementNamed(context, '/');
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
