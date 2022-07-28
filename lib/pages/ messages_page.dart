import 'dart:math';

import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Mesajlar'),),
        body: Column(
          children:[ Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context,index){
              bool benMiyim =Random().nextBool();
              return Align(
                alignment: benMiyim ? Alignment.centerRight : Alignment.centerLeft,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white10
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                        child: Text('mesaj mesaj mesaj mesaj mesaj mesaj mesaj')),
                  ),
                ),
              );
              },
            ),
          ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: DecoratedBox(
                             decoration: BoxDecoration(
                               border: Border.all(),
                               borderRadius: BorderRadius.all(
                                   Radius.circular(25.0)
                               )
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: TextField(
                                 decoration: InputDecoration(
                                   border: InputBorder.none,
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0)
                        ),
                        onPressed: (){},
                        child: const Text('Gönder')),
                  ),
                ],
              ),
            ),
        ],
        ),

    );
  }
}
