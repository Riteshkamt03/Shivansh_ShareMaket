import 'package:flutter/material.dart';

class MyEnrollmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Enrollment')),
      body: ListView(
        children: List.generate(5, (index) {
          return ListTile(
            title: Text('Enrollment $index'),
            subtitle: Text('Details of Enrollment $index'),
          );
        }),
      ),
    );
  }
}
