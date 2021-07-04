//@dart=2.9

class Questions {
  int id;
  int examId;
  String content;

  Questions({this.id, this.examId, this.content});
  Questions.copy(Questions from)
      : this(id: from.id, examId: from.examId, content: from.content);

  Questions.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], examId: json['examId'], content: json['content']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'examId': examId, 'content': content};
}
