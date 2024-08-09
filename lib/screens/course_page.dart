import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: ListView(
        children: List.generate(10, (index) {
          return ListTile(
            title: Text('Course $index'),
            subtitle: Text('Description of Course $index'),
          );
        }),
      ),
    );
  }
}
