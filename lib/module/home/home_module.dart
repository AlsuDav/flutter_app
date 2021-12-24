import 'package:flutter_app/module/cats/cats_screen.dart';
import 'package:flutter_app/module/cats/chat.dart';
import 'package:flutter_app/module/hw1/screens/home_page.dart';
import 'package:flutter_app/module/hw2/chat_api_module.dart';
import 'package:flutter_app/module/hw3/gallery_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MyHomePage(title: 'Homeworks')),
        ChildRoute('/hw1',
            child: (context, args) => const HomePage(),
            transition: TransitionType.leftToRightWithFade),
        ChildRoute('/widgets',
            child: (context, args) => const Chat(title: 'Widgets'),
            transition: TransitionType.leftToRightWithFade),
        ChildRoute('/cats',
            child: (context, args) => const Cats(title: 'Cats'),
            transition: TransitionType.leftToRightWithFade),
        ModuleRoute('/hw2',
            module: ChatApiModule(),
            transition: TransitionType.leftToRightWithFade),
        ModuleRoute('/hw3',
            module: GalleryModule(),
            transition: TransitionType.leftToRightWithFade),
      ];
}
