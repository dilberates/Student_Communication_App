import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentRepo extends ChangeNotifier{
 final students=[
   Student('Dilber', 'Kılıç', 22, 'Female'),
   Student('Ali', 'Kaya',6,'male'),
    Student('Ayşe', 'Oz',21, 'Female')];

 final Set<Student> favorite={};
  void love(Student student, bool boolLove) {
    if(boolLove) {
      favorite.add(student);
    }else{
      favorite.remove(student);
    }
    notifyListeners();
  }

 bool youLove(Student student) {
    return favorite.contains(student);
  }

}
final studentProvider=ChangeNotifierProvider((ref){
  return StudentRepo();
});

