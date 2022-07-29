class TeacherRepo{
  final List<Teacher> teachers=[
    Teacher('Emine', 'Kılıç', 22, 'Female'),
    Teacher('Ahmet', 'Kaya',6,'male'),
    Teacher('Selin', 'Oz',21, 'Female')];
}
class Teacher{
  String name ;
  String surname;
  int age;
  String sex;

  Teacher(this.name,this.surname,this.age,this.sex);
}
