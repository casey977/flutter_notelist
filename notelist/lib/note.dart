class Note {
  final int number;
  final DateTime moment;
  final String title;
  final String content;

  const Note({required this.number, required this.moment, required this.title, required this.content});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      number: json['number'],
      moment: json['moment'],
      title: json['title'],
      content: json['content']);
  }
}