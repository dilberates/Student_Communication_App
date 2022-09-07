import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeacherRepo extends ChangeNotifier{
  final List<Teacher> teachers=[
    Teacher('Emine', 'Kılıç', 22, 'Female'),
    Teacher('Ahmet', 'Kaya',6,'male'),
    Teacher('Selin', 'Oz',21, 'Female')];
}

final teachersProvider=ChangeNotifierProvider((ref){
  return TeacherRepo();
});

class Teacher{
  String name ;
  String surname;
  int age;
  String sex;

  Teacher(this.name,this.surname,this.age,this.sex);
}
