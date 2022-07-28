import 'package:flutter/material.dart';
import 'package:student_communication_app/pages/%20messages_page.dart';
import 'package:student_communication_app/pages/students_page.dart';
import 'package:student_communication_app/pages/teachers_page.dart';

void main() {
  runApp(const StudentApp());
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {

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
              title: const Text('Öğrenciler'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder:
                        (context)=>StudentsPage()
                    ));
              },
            ),
            ListTile(
              title: const Text('Öğretmenler'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder:
                        (context)=>TeachersPage()
                    ));
              },
            ),
            ListTile(
              title: const Text('Mesajlar'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder:
                        (context)=>MessagesPage()
                    ));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:(context) => StudentsPage(),
                      ));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:(context) => TeachersPage(),
                      ));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:(context) => MessagesPage(),
                      ));
                },
                child: Text('Mesajlar')
            ),
          ],
        ),
      ),
    );
  }
}
