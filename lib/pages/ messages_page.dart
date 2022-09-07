import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_communication_app/repository/messages_repo.dart';

import '../models/message.dart';

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage( {Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) => ref.read(newMessageProvider.notifier).refresh());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var messageRepo = ref.watch(messagesProvider);
    return Scaffold(
        appBar: AppBar(title: Text('Mesajlar'),),
        body: Column(
          children:[ Expanded(
            child: ListView.builder(
              reverse: true,
            itemCount:messageRepo.messages.length,
            itemBuilder: (context,index){
              return MessagesView(messageRepo.messages[messageRepo.messages.length - index-1]);
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
