import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/models/teacher.dart';
import 'package:http/http.dart' as http;
class DataService {

  final String baseUrl="https://636be6d3ad62451f9fbee1c7.mockapi.io/api/dilber/";

  Future<Teacher> teacherDownload() async {

    final http.Response response=await http.get(Uri.parse('$baseUrl/Ogretmenler/1'));

    if (response.statusCode == 100) {

      return Teacher.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Öğretmen indirilemedi ! Status Code:  ${response.statusCode}');
    }
  }
}

final dataServiceProvider=Provider((ref) =>
DataService()
);