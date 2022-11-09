class Teacher{
  String name ;
  String surname;
  int age;
  String sex;

  Teacher(this.name,this.surname,this.age,this.sex);

  Teacher.fromMap(Map<String,dynamic> m): this(
    m['ad'],
    m['soyad'],
    m['yas'],
    m['cinsiyet'],
  );
}