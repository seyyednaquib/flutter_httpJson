import 'package:flutter/material.dart';
import 'package:navigation_simple/models/exam.dart';
import 'package:navigation_simple/models/question.dart';
import 'package:navigation_simple/screens/questionTile.dart';
import 'package:navigation_simple/services.dart';

import '../constants.dart';
import '../models/user.dart';
import 'familyScreen.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  Future<Exam> _futureData;
  String examName;
  User examiner;
  List<Questions> questions;

  void initState() {
    super.initState();
    _futureData = dataService.getExam(1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Exam>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          examName = snapshot.data.examTitle;
          examiner = snapshot.data.examiner;
          questions = snapshot.data.questions;
          return _buildMainScreen();
        }
        return _buildFetchingDataScreen();
      },
    );
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, familyRoute,
                arguments: {'examiner': examiner});
          },
          child: const Text('Family'),
          backgroundColor: Colors.green,
        ),
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text(
                examName,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                examiner.shortName,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              questions.sort((a, b) => a.id.compareTo(b.id));
              return QuestionTile(questions: questions[index]);
            }));
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data in progress'),
          ],
        ),
      ),
    );
  }
}
