import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/repository/student_repo.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage( {Key? key}) : super(key: key);

  Widget build(BuildContext context,WidgetRef ref) {
    var studentRepo = ref.watch(studentProvider);
    return Scaffold(
      appBar: AppBar(),
        body:
        Column(
            children:[
               PhysicalModel(
                color: Colors.white10,
                elevation: 20,
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0,horizontal: 32.0),
                      child: Text('${studentRepo.students.length} Öğrenci')),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index) =>StudentRow(
                        studentRepo.students[index],
                      ),
                      separatorBuilder: (context,index)=>const  Divider(),
                      itemCount: studentRepo.students.length,)
              ),
            ],
        ),
    );
  }
}

class StudentRow extends ConsumerWidget{
  final Student student;
  const StudentRow(this.student, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var studentRepo = ref.watch(studentProvider);
    bool love=studentRepo.youLove(student);
    return ListTile(
      title:Text(student.name+' '+student.surname),
      leading: IntrinsicWidth(child: Center(child: Text(student.sex=='Female' ? '👧': '👦'))),
      trailing: IconButton(
          onPressed:() {
              ref.read(studentProvider).love(student,!love);
          },
          icon: Icon( love ? Icons.favorite : Icons.favorite_border)
      ),
    );
  }
}
