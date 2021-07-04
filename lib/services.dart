import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navigation_simple/models/exam.dart';

class Service {
  static const String baseUrl = 'http://192.168.0.115:3000';

  //helper Function
  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // Helper method to HTTP PATCH Request
  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future<Exam> getExam(int id) async {
    final json = await get('Exam/$id');

    // Resolve ExaminerId to their details data
    json['examiner'] = await get('users/${json['examinerid']}');

    // Get the list of assessments for the activity
    json['questions'] = await get('questions?reportId=$id');

    /* Resolve each memberId in assessments to its details
    for (int i = 0; i < json['assessments'].length; i++) {
      final memberId = json['assessments'][i]['memberId'];
      json['assessments'][i]['member'] = await get('users/$memberId');
    }*/

    return Exam.fromJson(json);
  }
}

final dataService = Service();
