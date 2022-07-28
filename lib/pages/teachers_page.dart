import 'package:flutter/material.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({Key? key}) : super(key: key);

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
          const PhysicalModel(
            color: Colors.white10,
            elevation: 20,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0,horizontal: 32.0),
                  child: Text('10 Öğretmen')),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) =>ListTile(
                    title:Text('Dilber hoca'),
                    leading: Text('👧'),//👦
                  ),
                  separatorBuilder: (context,index)=>const  Divider(),
                  itemCount: 23)
          ),
        ],
      ),
    );
  }
}
