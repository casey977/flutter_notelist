class Note {
  final DateTime moment;
  String title;
  String content;

  Note({required this.moment, required this.title, required this.content});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      moment: DateTime.parse(json['moment']),
      title: json['title'],
      content: json['content']);
  }
}