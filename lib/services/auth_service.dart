import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl;

  AuthService({String? base}) : baseUrl = base ?? _defaultBase();

  static String _defaultBase() {
    // Para emulator Android -> 10.0.2.2
    return 'http://10.0.2.2:8082';
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    // si tu backend espera JSON:
    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    } else {
      throw Exception('Login failed: ${res.statusCode} ${res.body}');
    }
  }

  Future<void> register(String username, String email, String password) async {
    final url = Uri.parse(
      '$baseUrl/auth/register',
    ); // agrega endpoint si lo tienes
    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );
    if (res.statusCode != 201 && res.statusCode != 200) {
      throw Exception('Register failed: ${res.statusCode} ${res.body}');
    }
  }
}
