import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobs/core/componnet/app_input.dart';
final _fireStore = FirebaseFirestore.instance;
late User signedInUser;
class TestViewMessage extends StatefulWidget {
  static const String message = "message";
  const TestViewMessage({super.key});

  @override
  State<TestViewMessage> createState() => _TestViewMessageState();
}

class _TestViewMessageState extends State<TestViewMessage> {
  final messageController = TextEditingController();
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? messageText;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser(){

    try{
      final user = _auth.currentUser;
      if(user!=null){
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch(e){
      print(e);
    }
  }
  // void getMessage()async{
  //   final messages = await _fireStore.collection("message").get();
  //   for(var message in messages.docs ){
  //     print(message.data());
  //   }
  // }
  // void messageStream()async{
  //   await for(var snapShot in _fireStore.collection("message").snapshots()){
  //     for(var message in snapShot.docs){
  //       print(message.data());
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Message Page"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            _auth.signOut();
            Navigator.pop(context);
          }, icon: Icon(Icons.close))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: MessageStreamBuilder()),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2,
                  color: Colors.orange
                )
              ),
            ),
            child: Row(
              children: [
                Expanded(child: AppInput(
                  hint: "Enter rhe message",
                  controller: messageController,
                  onChange: (p0) {
                    messageText = p0;
                  },
                )),
                TextButton(onPressed: () {
                  messageController.clear();
                  _fireStore.collection("message").add({
                    "text": messageText,
                    "sender":signedInUser.email,
                    "time":FieldValue.serverTimestamp(),
                  });
                }, child:Text("Send",style:
                  TextStyle(
                    color: Colors.blueAccent
                  ),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection("message").orderBy("time").snapshots(),
      builder: (context, snapshot) {
        List<MessageLine> messagesWidget= [];
        if(!snapshot.hasData){

        }
        final messages = snapshot.data!.docs;
        for(var message in messages){
          final messageText = message.get("text");
          final messageSender = message.get("sender");
          final currentUser = signedInUser.email;
          final messageWidget = MessageLine(sender: messageSender ,message: messageText, isMe: currentUser==messageSender,) ;
          messagesWidget.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            children: messagesWidget,
          ),
        );
      }, ) ;
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine({super.key,  this.sender,  this.message, required this.isMe});
  final String? sender;
  final String? message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text("$sender",
          style: TextStyle(
            color: Colors.yellow[900]
          )),
          Container(decoration: BoxDecoration(
              color:isMe? Colors.blue[800]:Colors.orange,
            borderRadius: isMe?BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
            ):BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            )
          ),child: Padding(padding:EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ), child: Text("$message",style: TextStyle(
            color: isMe?Colors.white:Colors.black45
          ),)),
          ),
        ],
      ),
    );
  }
}
