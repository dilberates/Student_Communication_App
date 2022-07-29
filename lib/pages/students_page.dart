import 'package:flutter/material.dart';
import 'package:student_communication_app/repository/student_repo.dart';

class StudentsPage extends StatefulWidget {
  final StudentRepo studentRepo;
  const StudentsPage(this.studentRepo, {Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
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
                      child: Text('${widget.studentRepo.students.length} Öğrenci')),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index) =>StudentRow(
                        widget.studentRepo.students[index],
                        widget.studentRepo
                      ),
                      separatorBuilder: (context,index)=>const  Divider(),
                      itemCount: widget.studentRepo.students.length,)
              ),
            ],
        ),
    );
  }
}

class StudentRow extends StatefulWidget {
  final Student student;
  final StudentRepo studentRepo;
  const StudentRow(this.student,this.studentRepo , {
    Key? key,
  }) : super(key: key);

  @override
  State<StudentRow> createState() => _StudentRowState();
}

class _StudentRowState extends State<StudentRow> {
  @override
  Widget build(BuildContext context) {
    bool love=widget.studentRepo.youLove(widget.student);
    return ListTile(
      title:Text(widget.student.name+' '+widget.student.surname),
      leading: IntrinsicWidth(child: Center(child: Text(widget.student.sex=='Female' ? '👧': '👦'))),
      trailing: IconButton(
          onPressed:() {
            setState((){
              widget.studentRepo.love(widget.student,!love);
            });
          },
          icon: Icon( love ? Icons.favorite : Icons.favorite_border)
      ),
    );
  }
}
