//@dart=2.9

import 'package:navigation_simple/models/question.dart';
import 'package:navigation_simple/models/user.dart';

class Exam {
  int id;
  String examTitle;
  List<Questions> questions;
  User examiner;

  Exam({this.id, this.examTitle, this.examiner, this.questions});

  Exam.copy(from)
      : this(
            id: from.id,
            examTitle: from.examTitle,
            examiner: from.examiner,
            questions: from.questions);

  Exam.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            examTitle: json['title'],
            examiner: User.fromJson(json['examiner']),
            questions: (json['questions'] as List)
                .map((e) => Questions.fromJson(e))
                .toList());

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': examTitle,
        'examinerId': examiner.id,
        'questions': questions
      };
}
