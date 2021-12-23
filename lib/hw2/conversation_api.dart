import 'package:flutter/material.dart';
import 'package:flutter_app/models/message.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../app_theme.dart';
import 'models/message_api.dart';

class ConversationApi extends StatelessWidget {
  const ConversationApi({
    Key? key,
    // required this.user,
    required this.messages,
  }) : super(key: key);

  // final User user;
  final List<MessageApi> messages;

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //     child: Observer(builder: (context)
    // {
      return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, int index) {
            final message = messages[index];
            bool isMe = message.author == currentUser.name;
            return Container(
                margin: EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isMe)
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(user1.avatar),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.6),
                          decoration: BoxDecoration(
                              color:
                              isMe ? MyTheme.kAccentColor : Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(isMe ? 12 : 0),
                                bottomRight: Radius.circular(isMe ? 0 : 12),
                              )),
                          child: Column(
                            children: [
                              Text(
                                  isMe ? '' : messages[index].author ,
                                style: MyTheme.bodyTextAuthor,
                                )
                              ,
                              Text(
                                messages[index].message,
                                style: MyTheme.bodyTextMessage.copyWith(
                                    color: isMe ? Colors.white : Colors.grey[800]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!isMe)
                            SizedBox(
                              width: 40,
                            ),
                          Icon(
                            Icons.done_all,
                            size: 20,
                            color: MyTheme.bodyTextTime.color,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            // message.time,
                            DateTime.now().toString(),
                            style: MyTheme.bodyTextTime,
                          )
                        ],
                      ),
                    )
                  ],
                ));
          });

  // }),
  //   );
  }
}
