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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shivansh Share Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CreateAccountPage(),
        '/login': (context) => const LoginPage(),
        '/logout': (context) => const LogoutPage(),
        '/my_account': (context) => const MyAccountPage(),
        '/edit_account': (context) => const EditAccountPage(),
        '/course_page': (context) => const CoursePage(),
        '/my_enrollment': (context) => const MyEnrollmentPage(),
        '/session_update': (context) => const SessionUpdatePage(),
      },
    );
  }
}
