// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  final _$messagesAtom = Atom(name: '_ChatStore.messages');

  @override
  ObservableList<MessageApi> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<MessageApi> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  void fetchNewMessage(MessageApi new_message) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.fetchNewMessage');
    try {
      return super.fetchNewMessage(new_message);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
