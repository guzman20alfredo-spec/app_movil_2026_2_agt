import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../services/post_service.dart';

class PostRepository {
  PostRepository(this._service);
  final PostService _service;

  // TODO 4: convertir el JSON en List<Post> y traducir los errores
  Future<List<Post>> getPosts() async {
    try {
      final jsonList = await _service.fetchPostsJson();
      return jsonList
          .map((json) => Post.fromJson(json as Map<String, dynamic>))
          .toList();
    } on TimeoutException {
      throw const ApiException('La solicitud tardó demasiado...');
    } on SocketException {
      throw const ApiException('Sin conexión a internet.');
    } on FormatException {
      throw const ApiException(
        'La respuesta del servidor tiene un formato inesperado.',
      );
    } on http.ClientException {
      throw const ApiException('Error de comunicación con el servidor.');
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException(e.toString());
    }
  }
}
