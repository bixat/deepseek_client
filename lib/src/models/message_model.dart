class Message {
  final String content;
  final String role;
  final bool hide;

  Message({required this.content, required this.role, this.hide = false});

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