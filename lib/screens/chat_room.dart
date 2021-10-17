import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/widgets/build_chat_composer.dart';
import 'package:flutter_app/widgets/conversation.dart';

import '../app_theme.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key, required this.user}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
  final User user;
}

class _ChatRoomState extends State<ChatRoom> {
  List<String> _items = ['message 1', 'message 2'];

  TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    setState(() {
      _items.add(text);
    });
    _textEditingController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.kPrimaryColor,
        toolbarHeight: 100,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
                radius: 30, backgroundImage: AssetImage(widget.user.avatar)),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: MyTheme.chatSenderName,
                ),
                Text(
                  'online',
                  style: MyTheme.bodyText1.copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam_outlined,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                size: 28,
              ))
        ],
        elevation: 0,
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  child: Conversation(user:widget.user),
                ),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!1
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 60,

                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey[500],
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type your message ...',
                                hintStyle: TextStyle(color:Colors.grey[500]),
                              ),
                            ),
                          ),
                          Icon(Icons.attach_file, color: Colors.grey[500])

                        ],
                      ),
                    )),
                    SizedBox(width: 16,),
                    CircleAvatar(backgroundColor: MyTheme.kAccentColor,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
