class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    if (json case {
      'userId': int userId,
      'id': int id,
      'title': String title,
      'body': String body,
    }) {
      return Post(userId: userId, id: id, title: title, body: body);
    }
    throw const FormatException('Formato de JSON inválido para Post');
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
