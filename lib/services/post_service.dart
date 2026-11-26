import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  @override
  String toString() => message;
}

class PostService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  // TODO 3: hacer GET a '$_baseUrl/posts' aplicando .timeout(_timeout)
  Future<List<dynamic>> fetchPostsJson() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/posts'))
        .timeout(_timeout);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw ApiException(
        'Error del servidor con código: ${response.statusCode}',
      );
    }
  }
}
