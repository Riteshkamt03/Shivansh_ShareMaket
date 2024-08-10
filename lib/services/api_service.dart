import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import '../constants.dart';

class ApiService {
  final String baseUrl = ApiConstants.baseUrl;
  final Logger _logger = Logger('ApiService');

  ApiService() {
    // Enable root logger to capture all logs
    Logger.root.level = Level.ALL; // Set the root level to ALL
    Logger.root.onRecord.listen((record) {
      // Customize the log output format and destination
      //print('${record.level.name}: ${record.time}: ${record.message}');
    });

    // Configure the ApiService logger
    //_logger.level = Level.ALL; // Set the ApiService logger level to ALL
  }

  Future<bool> createAccount({
    required String name,
    required String dob,
    required String phone,
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/create-account/');
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    final body = jsonEncode({
      'name': name,
      'dob': dob,
      'phone': phone,
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 201) {
        return true;
      } else {
        _logger.severe(
            'Failed to create account. Status code: ${response.statusCode}, Body: ${response.body}');
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe('Error in createAccount: $e', e, stackTrace);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/login/');
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        _logger.severe(
            'Failed to login. Status code: ${response.statusCode}, Body: ${response.body}');
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe('Error in login: $e', e, stackTrace);
      return false;
    }
  }

  Future<bool> updateAccount({
    required int userId,
    required String name,
    required String email,
    required String phone,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/update-account/$userId/');
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};
    final body = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
    });

    try {
      final response = await http.put(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        _logger.severe(
            'Failed to update account. Status code: ${response.statusCode}, Body: ${response.body}');
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe('Error in updateAccount: $e', e, stackTrace);
      return false;
    }
  }
}
