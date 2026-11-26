import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/posts_viewmodel.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostsViewModel>().loadPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PostsViewModel>();

    Widget bodyContent;

    switch (vm.state) {
      case LoadState.initial:
      case LoadState.loading:
        bodyContent = const Center(
          child: CircularProgressIndicator(color: Colors.blue, strokeWidth: 3),
        );
        break;
      case LoadState.error:
        bodyContent = Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_off, size: 64, color: Colors.blueGrey),
                const SizedBox(height: 16),
                Text(
                  vm.errorMessage ?? 'Ocurrió un error inesperado',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => vm.loadPosts(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        );
        break;
      case LoadState.success:
        bodyContent = ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: vm.posts.length,
          itemBuilder: (context, index) {
            final post = vm.posts[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                  child: Text(
                    '${post.id}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  post.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                ),
              ),
            );
          },
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicaciones - MVVM (Estilo Azul)'),
        centerTitle: true,
      ),
      body: bodyContent,
    );
  }
}
