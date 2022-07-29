class StudentRepo{
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
  }

 bool youLove(Student student) {
    return favorite.contains(student);
  }
}
class Student{
  String name ;
  String surname;
  int age;
  String sex;

  Student(this.name,this.surname,this.age,this.sex);
}