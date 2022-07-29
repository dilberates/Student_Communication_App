import 'dart:math';

import 'package:flutter/material.dart';
import 'package:student_communication_app/repository/messages_repo.dart';

class MessagesPage extends StatefulWidget {
  final MessageRepo messageRepo;
  const MessagesPage(this.messageRepo, {Key? key}) : super(key: key);

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
            itemCount:widget.messageRepo.messages.length,
            itemBuilder: (context,index){
              return MessagesView(widget.messageRepo.messages[widget.messageRepo.messages.length - index-1]);
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

class MessagesView extends StatelessWidget {
  final Message messag;
  const MessagesView(this.messag, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messag.sender=='Ali'? Alignment.centerRight : Alignment.centerLeft,
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
              child: Text(messag.chat)),
        ),
      ),
    );
  }
}
