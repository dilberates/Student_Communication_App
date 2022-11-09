import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/models/teacher.dart';
import 'package:http/http.dart' as http;
class DataService {

  final String baseUrl="https://636be6d3ad62451f9fbee1c7.mockapi.io/";

  Future<Teacher> teacherDownload() async {

    final http.Response response=await http.get(Uri.parse('$baseUrl/api/dilber/'));

    if (response.statusCode == 200) {

      return Teacher.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album ${response.statusCode}');
    }
  }
}

final dataServiceProvider=Provider((ref) =>
DataService()
);