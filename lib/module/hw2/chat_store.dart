import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';
import 'api_client_chat.dart';
import 'models/message_api.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {


  @observable

  ObservableList<MessageApi> messages = ObservableList.of([]);

  @action
  void fetchNewMessage(MessageApi new_message) {

    Random random = new Random();
    RestClient restClient = RestClient(Dio());
    restClient.getMessages().then((List<MessageApi> messages) {
      this.messages.add(new_message);
      bool flag = true;
      MessageApi msg = messages[random.nextInt(messages.length)];
      while(flag) {
        msg = messages[random.nextInt(messages.length)];
        flag = msg.author != new_message.author ? false : true;

      }
      this.messages.add(msg);
    }).catchError((error) {
      print(error.toString());
    });
  }


}
