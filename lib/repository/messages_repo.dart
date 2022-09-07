import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/message.dart';

class MessageRepo extends ChangeNotifier{
 final List<Message> messages=[
  Message('Nasılsın ? ', 'Ali', DateTime.now().subtract(const Duration(minutes: 1))),
  Message('Merhaba', 'Ayşe',DateTime.now().subtract(const Duration(minutes: 2))),
  Message('asdsaddas', 'Ali', DateTime.now().subtract(const Duration(minutes: 1)))
 ];
}

class NewMessageNum extends StateNotifier<int>{
  NewMessageNum(int state) : super(state);
  void refresh(){
   state=0;
  }
}

final newMessageProvider=StateNotifierProvider<NewMessageNum,int>((ref) {
 return NewMessageNum(4);
});

final messagesProvider=ChangeNotifierProvider((ref) {
return MessageRepo();
});

