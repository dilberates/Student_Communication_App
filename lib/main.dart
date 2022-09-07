import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/pages/%20messages_page.dart';
import 'package:student_communication_app/pages/students_page.dart';
import 'package:student_communication_app/pages/teachers_page.dart';
import 'package:student_communication_app/repository/messages_repo.dart';
import 'package:student_communication_app/repository/student_repo.dart';
import 'package:student_communication_app/repository/teacher_repo.dart';

void main() {
  runApp(ProviderScope(child:StudentApp()));
}

class StudentApp extends StatelessWidget {
  const StudentApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black26,
      ),
      home: const MyHomePage(title:'Öğrenci Ana Sayfa'),
    );
  }
}

class MyHomePage extends ConsumerWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final studentRepo=ref.watch(studentProvider);
    var teacherRepo = ref.watch(teachersProvider);
    final int a = ref.watch(newMessageProvider);
    print(a);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Text('Menü'),
            ),
            ListTile(
              title:Text('${studentRepo.students.length} Öğrenci'),
              onTap: () {
               goStudents(context);
              },
            ),
            ListTile(
              title: Text('${teacherRepo.teachers.length} Öğretmen'),
              onTap: () {
                goTeachers(context);
              },
            ),
            ListTile(
              title:Text('${a} Yeni Mesaj'),
              onTap: () {
               goMessages(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black26,
                padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0)
              ),
                onPressed:(){
                  goStudents(context);
                },
                child: Text('Öğrenciler')
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black26,
                    padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0)
                ),
                onPressed:(){
                  goTeachers(context);
                },
                child: Text('Öğretmenler')
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black26,
                    padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0)
                ),
                onPressed:(){
                  goMessages(context);
                },
                child: Text('Mesajlar')
            ),
          ],
        ),
      ),
    );
  }
  void goStudents(BuildContext context){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder:(context) {
            return StudentsPage();
          },
        ));

  }
  void goTeachers(BuildContext context){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder:(context) {
            return TeachersPage();
          },
        ));

  }
  Future<void> goMessages(BuildContext context) async {
    await Navigator.of(context).push(
        MaterialPageRoute(
          builder:(context) {
            return MessagesPage();
          },
        ));

  }
}

