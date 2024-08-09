import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:5000'; // Update to your backend URL

  Future<bool> createAccount({
    required String name,
    required String dob,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/create_account'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'name': name,
          'dob': dob,
          'phone': phone,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        // Example check: assuming a 'success' field is returned
        return responseBody['success'] ?? false;
      } else {
        throw Exception('Failed to create account');
      }
    } catch (e) {
      print('Error: $e'); // Log or handle the error as needed
      return false;
    }
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error: $e'); // Log or handle the error as needed
      return false;
    }
  }

  Future<bool> updateAccount({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/update_account'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error: $e'); // Log or handle the error as needed
      return false;
    }
  }
}
