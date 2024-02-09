class Note {
  final DateTime moment;
  final String title;
  final String content;

  const Note({required this.moment, required this.title, required this.content});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      moment: json['moment'],
      title: json['title'],
      content: json['content']);
  }
}