import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MyEnrollmentPage extends StatefulWidget {
  const MyEnrollmentPage({Key? key}) : super(key: key);

  @override
  _MyEnrollmentPageState createState() => _MyEnrollmentPageState();
}

class _MyEnrollmentPageState extends State<MyEnrollmentPage> {
  final ApiService _apiService = ApiService();
  late Future<List<Enrollment>> _enrollmentsFuture;

  @override
  void initState() {
    super.initState();
    // Fetch enrollments
    _enrollmentsFuture = _apiService.fetchEnrollments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Enrollment')),
      body: FutureBuilder<List<Enrollment>>(
        future: _enrollmentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No enrollments found'));
          } else {
            final enrollments = snapshot.data!;
            return ListView.builder(
              itemCount: enrollments.length,
              itemBuilder: (context, index) {
                final enrollment = enrollments[index];
                return ListTile(
                  title: Text('Enrollment ${index + 1}'),
                  subtitle: Text('Course: ${enrollment.courseTitle}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
