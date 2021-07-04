import 'package:flutter/material.dart';

import '../models/question.dart';

class QuestionTile extends StatelessWidget {
  final Questions questions;
  QuestionTile({this.questions});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          child: Column(children: [
            ListTile(
              title: Text('${questions.id}'),
              subtitle: Text(' ${questions.content} ',
                  style: TextStyle(color: Colors.black.withOpacity(0.6))),
            ),
          ]),
        ));
  }
}
