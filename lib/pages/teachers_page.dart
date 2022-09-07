import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/repository/teacher_repo.dart';

class TeachersPage extends ConsumerWidget {
  const TeachersPage( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var teacherRepo = ref.watch(teachersProvider);
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
                  child: Text('${teacherRepo.teachers.length} Öğretmen')),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) =>TeacherRow(
                      teacherRepo.teachers[index]),
                  separatorBuilder: (context,index)=>const  Divider(),
                  itemCount:teacherRepo.teachers.length)
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
