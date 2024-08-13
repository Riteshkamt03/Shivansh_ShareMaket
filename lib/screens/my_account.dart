import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final ApiService _apiService = ApiService();
  late Future<User> _userFuture;

  // Example userId, replace with actual userId from your app logic
  final int userId = 1;

  @override
  void initState() {
    super.initState();
    // Fetch user details with userId
    _userFuture = _apiService.fetchUserDetails(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Account')),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user data available'));
          } else {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text('Email: ${user.email}'),
                  Text('Phone Number: ${user.phone}'),
                  // Add more fields as needed
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
