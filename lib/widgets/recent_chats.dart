import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';
import 'package:flutter_app/screens/chat_room.dart';

import '../app_theme.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({
    Key? key,
  }) : super(key: key);

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(children: [
            Text(
              'Recent Chats',
              style: MyTheme.heading2,
            ),
            Spacer(),
            Icon(
              Icons.search,
              color: MyTheme.kPrimaryColor,
            )
          ]),
        ),
        Expanded(
          child: ListView.builder(

              itemCount: recentChats.length,
              itemBuilder: (context, int index) {
                final recentChat = recentChats[index];
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(recentChat.sender.avatar),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                            CupertinoPageRoute(builder: (context){
                              return ChatRoom(user: recentChat.sender);
                            }));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recentChat.sender.name,
                                style: MyTheme.heading2.copyWith(fontSize: 16),
                              ),
                              Text(
                                recentChat.text,
                                style: MyTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              recentChat.time,
                              style: MyTheme.bodyTextTime,
                            ),
                          ],
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
