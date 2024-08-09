import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/create_account.dart';
import 'screens/logout.dart';
import 'screens/my_account.dart';
import 'screens/edit_account.dart';
import 'screens/course_page.dart';
import 'screens/my_enrollment.dart';
import 'screens/session_update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shivansh Share Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CreateAccountPage(),
        '/login': (context) => LoginPage(),
        '/logout': (context) => LogoutPage(),
        '/my_account': (context) => MyAccountPage(),
        '/edit_account': (context) => EditAccountPage(),
        '/course_page': (context) => CoursePage(),
        '/my_enrollment': (context) => MyEnrollmentPage(),
        '/session_update': (context) => SessionUpdatePage(),
      },
    );
  }
}
