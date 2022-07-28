class MessageRepo{
 final List<Message> messages=[
  Message('Nasılsın ? ', 'Ali', DateTime.now().subtract(const Duration(minutes: 1))),
  Message('Merhaba', 'Ayşe',DateTime.now().subtract(const Duration(minutes: 2))),
  Message('asdsaddas', 'Ali', DateTime.now().subtract(const Duration(minutes: 1)))
 ];
}
 class Message{
 String chat;
 String sender;
 DateTime date;

 Message(this.chat,this.sender,this.date);
 }