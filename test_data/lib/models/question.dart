class Question {
  final String title;
  final int id;
  final String detail;
  // final List<Option> options;
  final String opinion;
  final int result;
  const Question(
      {required this.id,
      required this.title,
      required this.result,
      // required this.options,
      required this.detail,
      required this.opinion});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'detail': detail, 'opinion': opinion};
  }

  factory Question.fromSqfliteDatabase(Map<String, dynamic> map) => Question(
      id: map['id'],
      title: map['title'],
      result: map['result'],
      // options: map['options'],
      detail: map['detail'],
      opinion: map['opinion']);

  @override
  String toString() {
    return "Question{id: $id, title:$title}";
  }
}
