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
              const PhysicalModel(
                color: Colors.white10,
                elevation: 20,
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0,horizontal: 32.0),
                      child: Text('10 Öğrenci')),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index) =>ListTile(
                        title:Text('Dilber'),
                        leading: Text('👧'),//👦
                        trailing: IconButton(
                            onPressed:() {
                            },
                            icon: Icon(Icons.favorite_border)
                        ),
                      ),
                      separatorBuilder: (context,index)=>const  Divider(),
                      itemCount: 23)
              ),
            ],
        ),
    );
  }
}
