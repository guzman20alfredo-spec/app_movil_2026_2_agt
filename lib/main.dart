import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/post_repository.dart';
import 'services/post_service.dart';
import 'viewmodels/posts_viewmodel.dart';
import 'views/posts_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PostsViewModel(PostRepository(PostService())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Publicaciones MVVM - Azul',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black26,
        ),
      ),
      home: const PostsView(),
    );
  }
}
