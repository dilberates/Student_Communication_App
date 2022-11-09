import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/repository/teacher_repo.dart';

import '../models/teacher.dart';

class TeachersPage extends ConsumerWidget {
  const TeachersPage( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var teacherRepo = ref.watch(teachersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          const Text('Öğretmenler'),
            Align(
              alignment: Alignment.centerRight,
            child: downloadButton(),
          )
        ]),
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

class downloadButton extends StatefulWidget {
  const downloadButton({
    Key? key,
  }) : super(key: key);

  @override
  State<downloadButton> createState() => _downloadButtonState();
}

class _downloadButtonState extends State<downloadButton> {

  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:() async {
       await ref.read(teachersProvider).download();
    }, icon: Icon(
      Icons.download
    ));
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
