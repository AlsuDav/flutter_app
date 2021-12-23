import 'package:flutter_modular/flutter_modular.dart';

import 'chat_api_room.dart';
import 'chat_store.dart';

class ChatApiModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ChatStore())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/',
        child: (context, args) => const ChatApiRoom())
  ];
}