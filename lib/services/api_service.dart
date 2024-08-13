import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8000'; // Your Django backend URL

  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/courses/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<bool> createAccount({
    required String name,
    required String dob,
    required String phone,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'date_of_birth': dob,
        'phone_number': phone,
        'email': email,
        'password': password,
      }),
    );
    return response.statusCode == 201;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/token/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    return response.statusCode == 200;
  }

  Future<User> fetchUserDetails(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId/'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<List<Enrollment>> fetchEnrollments() async {
    final response = await http.get(Uri.parse('$baseUrl/enrollments/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Enrollment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load enrollments');
    }
  }

  Future<bool> updateAccount({
    required int userId,
    required String name,
    required String email,
    required String phone,
  }) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/users/$userId/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'phone_number': phone,
      }),
    );
    return response.statusCode == 200;
  }
}

class Course {
  final String title;
  final String description;

  Course({required this.title, required this.description});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      description: json['description'],
    );
  }
}

class User {
  final String name;
  final String email;
  final String phone;

  User({required this.name, required this.email, required this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone_number'],
    );
  }
}

class Enrollment {
  final String courseTitle;

  Enrollment({required this.courseTitle});

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      courseTitle: json['course']['title'],
    );
  }
}
