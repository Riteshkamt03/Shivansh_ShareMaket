import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
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
