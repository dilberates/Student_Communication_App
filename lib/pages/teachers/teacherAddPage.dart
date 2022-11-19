import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/models/teacher.dart';
import 'package:student_communication_app/services/data_service.dart';

class TeachersHome extends ConsumerStatefulWidget {
  const TeachersHome({Key? key}) : super(key: key);

  @override
  _TeachersHomeState createState() => _TeachersHomeState();
}

class _TeachersHomeState extends ConsumerState<TeachersHome> {
  final Map<String, dynamic> girilen = {};
  final _formKey = GlobalKey<FormState>();
  bool isSaved=false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Öğretmen Ekle"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Ad"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ad alanı boş girilemez !";
                  }
                },
                onSaved: (newValue) {
                  girilen['ad'] =(newValue!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Soyad"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Soyad alanı boş girilemez !";
                  }
                },
                onSaved: (newValue) {
                  girilen['soyad'] = (newValue!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Yaş"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Yaş alanı boş girilemez !";
                  }
                },
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  girilen['yas'] = int.parse(newValue!);
                },
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    child: Text('Erkek'),
                    value: 'erkek',
                  ),
                  DropdownMenuItem(
                    child: Text("Kız"),
                    value: 'kız',
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    girilen['cinsiyet'] = value;
                  });
                },
                value: girilen['cinsiyet'],
                validator: (value) {
                  if (value == null) {
                    return "lütfen bir cinsiyet seçiniz";
                  }
                },
              ),
              isSaved ? Center(child: CircularProgressIndicator()) : ElevatedButton(
                  onPressed:(){
                    final formState=_formKey.currentState;
                    if(formState==null) return null;
                    if(formState.validate()==true){
                      formState.save();
                      _add();
                    }

                  },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _add () async {
    bool finish=false;
    while(!finish){
      try {
        setState(() {
          isSaved = true;
        });
        await save();
        finish=true;
        Navigator.of(context).pop(true);
      } catch (e) {
        final snackbar=ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
        await snackbar.closed;

      } finally {
        setState(() {
          isSaved= false;
        });
      }
    }


  }
int i=0;
  Future<void> save() async {
    i++;
    if(i<3) {
      throw "Kayıt yapılamadı";
    }else{
      await ref.read(dataServiceProvider).teacherAdd(Teacher.fromMap(girilen));
    }
  }
}


