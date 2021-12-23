import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/module/hw1/models/user.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'api_client_chat.dart';
import '../../app_theme.dart';
import 'chat_store.dart';
import 'conversation_api.dart';
import 'models/message_api.dart';

class ChatApiRoom extends StatefulWidget {
  const ChatApiRoom({Key? key}) : super(key: key);

  @override
  _ChatApiRoomState createState() => _ChatApiRoomState();
}

class _ChatApiRoomState extends State<ChatApiRoom> {

  TextEditingController _textEditingController = TextEditingController();
  final ChatStore _chatStore = Modular.get<ChatStore>();

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
                radius: 30, backgroundImage: AssetImage('assets/images/ava_2.jpg')),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // widget.user1.name,
                  'Флудилка',
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
        onTap: () {
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
                  child: Observer(builder: (context) {
                    return
                    ConversationApi(
                      // user: widget.user,
                      messages: _chatStore.messages,
                    );
                  }),

                ),
              ),
            ),
            //!!!!!!!!!!!!!!!!!!!!!!
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
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type your message ...',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          Icon(Icons.attach_file, color: Colors.grey[500])
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      // CircleAvatar(backgroundColor: MyTheme.kAccentColor,

                      child: Icon(Icons.add),
                      onTap: () {
                        _sendMessage(

                            // DateFormat('HH:mm a').format(DateTime.now()),
                            _textEditingController.text);
                      },
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    RestClient restClient = RestClient(Dio());
    restClient
        .sendMessage(MessageApi(author: currentUser.name, message: text))

        .then((value) => {_chatStore.fetchNewMessage(MessageApi(author: currentUser.name, message: text))});
    _textEditingController.clear();
  }
}

