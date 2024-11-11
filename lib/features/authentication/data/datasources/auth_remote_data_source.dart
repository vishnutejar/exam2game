import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://exam2game.in/user-service/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> signupUser(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://exam2game.in/user-service/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}