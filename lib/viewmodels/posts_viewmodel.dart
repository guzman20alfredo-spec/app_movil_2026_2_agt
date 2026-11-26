import 'package:flutter/foundation.dart';

import '../models/post.dart';
import '../repositories/post_repository.dart';
import '../services/post_service.dart';

enum LoadState { initial, loading, success, error }

class PostsViewModel extends ChangeNotifier {
  PostsViewModel(this._repository);
  final PostRepository _repository;

  LoadState state = LoadState.initial;
  List<Post> posts = [];
  String? errorMessage;

  // TODO 5: command loadPosts(): pasar a loading, notificar, pedir datos y pasar a success o error
  Future<void> loadPosts() async {
    state = LoadState.loading;
    errorMessage = null;
    notifyListeners();

    try {
      posts = await _repository.getPosts();
      state = LoadState.success;
    } catch (e) {
      state = LoadState.error;
      errorMessage = e is ApiException ? e.message : e.toString();
    } finally {
      notifyListeners();
    }
  }
}
