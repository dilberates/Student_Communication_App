import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/models/teacher.dart';

class DataService {


  Teacher teacherDownload() {
    const j ="""{
    "ad": "Hakkı",
    "soyad": "Alsın",
    "yas": 23,
    "cinsiyet": "Erkek"
    }""";

    final m = jsonDecode(j);
    final teacher=Teacher.fromMap(m);

    return teacher;
  }

}

final dataServiceProvider=Provider((ref) =>
DataService()
);