import 'package:flutter/material.dart';
import 'package:student_communication_app/repository/teacher_repo.dart';

class TeachersPage extends StatefulWidget {
  final TeacherRepo teacherRepo;
  const TeachersPage(this.teacherRepo, {Key? key}) : super(key: key);

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğretmenler'),
      ),
      body:
      Column(
        children:[
          PhysicalModel(
            color: Colors.white10,
            elevation: 20,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0,horizontal: 32.0),
                  child: Text('${widget.teacherRepo.teachers.length} Öğretmen')),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) =>TeacherRow(
                      widget.teacherRepo.teachers[index]),
                  separatorBuilder: (context,index)=>const  Divider(),
                  itemCount: widget.teacherRepo.teachers.length)
          ),
        ],
      ),
    );
  }
}

class TeacherRow extends StatelessWidget {
  final Teacher teacher ;
  const TeacherRow(this.teacher, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(teacher.name+' '+teacher.surname),
      leading: IntrinsicWidth(child: Center(child: Text(teacher.sex=='Female'?'👧': '👦'))),
    );
  }
}
