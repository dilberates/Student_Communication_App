import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/services/data_service.dart';

import '../models/teacher.dart';

class TeacherRepo extends ChangeNotifier{
  final List<Teacher> teachers=[
    Teacher('Emine', 'Kılıç', 22, 'Female'),
    Teacher('Ahmet', 'Kaya',6,'male'),
    Teacher('Selin', 'Oz',21, 'Female')];

  final DataService dataService;
  TeacherRepo(this.dataService);
  
  Future<void> download() async {
  Teacher teacher = await dataService.teacherDownload();
  teachers.add(teacher);
  notifyListeners();
  }
}

final teachersProvider=ChangeNotifierProvider((ref){
  return TeacherRepo(ref.watch(dataServiceProvider));
});


