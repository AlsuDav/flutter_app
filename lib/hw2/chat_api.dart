import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/hw2/chat_store.dart';
import 'package:flutter_app/hw2/models/message_api.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../api_client_chat.dart';
import '../detail_info.dart';

class ChatApi extends StatefulWidget {
  const ChatApi({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ChatApiState createState() => _ChatApiState();
}

class _ChatApiState extends State<ChatApi> {
  // List<String> _items = ['message 1', 'message 2'];

  TextEditingController _textEditingController = TextEditingController();
  ChatStore _chatStore = ChatStore();
  String currentUser = 'Alsu';
  int i = 0;



  // @override
  // void initState() {
  //   super.initState();
  //   Timer.run(() => _asyncInputDialog(context));
  // }

  // _asyncInputDialog(BuildContext context) async {
  //   String username = '';
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     barrierColor: const Color(0x12929191),
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Введите свое имя'),
  //         content: Row(
  //           children: [
  //             Expanded(
  //                 child: TextField(
  //                   decoration: InputDecoration(
  //                     hintText: 'Ваше имя...',
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(15),
  //
  //                     ),
  //                     focusedBorder: OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(15),
  //
  //                     ),
  //                     filled: true,
  //                     contentPadding: const EdgeInsets.all(15),
  //                   ),
  //                   onChanged: (value) {
  //                     username = value;
  //                   },
  //                 ))
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             child: const Text(
  //               'Готово',
  //             ),
  //             onPressed: () {
  //               currentUser = username;
  //               _chatStore.fetchNewMessage();
  //               Navigator.of(context).pop(username);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  void _sendMessage(String text) {
    RestClient restClient = RestClient(Dio());

    restClient
        .sendMessage(MessageApi(author: currentUser, message: text))
        
        .then((value) => {_chatStore.fetchNewMessage(MessageApi(author: currentUser, message: text))});
    _textEditingController.clear();
  }

  // void _addToList(String text) {
  //   setState(() {
  //     _items.add(text);
  //   });
  //   _textEditingController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Observer(builder: (context) {
                    return ListView(
                      children: _chatStore.messages.map((item) {
                        return ListTile(
                          title: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.author,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      item.message,
                                    )
                                  ]),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ),
                //   item,
                //   style: const TextStyle(
                //       color: Colors.deepPurple, fontSize: 16),
                // ),
                // onTap: () {
                //
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => DetailInfo(title: item)));
                //
                // }

                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _textEditingController,
                    )),
                    GestureDetector(
                      child: Icon(Icons.add),
                      onTap: () {

                        _sendMessage(_textEditingController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          )),
        ));
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
