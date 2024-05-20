class Message {
  final String content;
  final String role;

  Message({required this.content, required this.role});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'role': role,
    };
  }
}