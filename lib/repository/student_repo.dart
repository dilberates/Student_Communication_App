class StudentRepo{
 final List<Student> students=[
   Student('Dilber', 'Kılıç', 22, 'Female'),
   Student('Ali', 'Kaya',6,'male'),
    Student('Ayşe', 'Oz',21, 'Female')];
}
class Student{
  String name ;
  String surname;
  int age;
  String sex;

  Student(this.name,this.surname,this.age,this.sex);
}