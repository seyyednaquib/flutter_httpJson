import 'package:flutter/material.dart';
import 'package:navigation_simple/screens/ExamScreen.dart';
import 'package:navigation_simple/screens/familyScreen.dart';

import 'constants.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
    case summaryRoute:
      return MaterialPageRoute(
        builder: (context) => ExamScreen(),
      );
    case familyRoute:
      return MaterialPageRoute(
        builder: (context) =>
            FamilyScreen(examiner: settings.arguments['examiner']),
      );
  }
  return null;
}
