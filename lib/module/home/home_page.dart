import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module/hw1/screens/home_page.dart';
import 'package:flutter_app/module/hw2/chat_api.dart';
import 'package:flutter_app/module/hw2/chat_api_room.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_theme.dart';
import '../cats/cats_screen.dart';
import '../cats/chat.dart';
import '../../theme_store.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _items = const ['Widgets', 'NiceChat_hw1', 'Cats', 'ChatApi_hw2'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.kPrimaryColor,
          title: Text(
            widget.title,
          ),
          actions: [
            GestureDetector(
              child: Icon(Icons.error),

              // onTap: () {
              //   context.read<ThemeStore>().setTheme(ThemeData.dark());
              // },
            )
          ],
        ),
        body: SafeArea(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: _items.map((item) {
                          return ListTile(
                            title: Text(
                              item,
                              style: const TextStyle(
                                  color: Colors.deepPurple, fontSize: 16),
                            ),
                            onTap: () {



                              switch (item) {
                                case 'Widgets':
                                  Modular.to.pushNamed('/widgets');
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => Chat(title: item)));
                                  break;

                                case 'NiceChat_hw1':
                                  Modular.to.pushNamed('/hw1');
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => HomePage()));
                                  break;
                                case 'Cats':
                                  Modular.to.pushNamed('/cats');
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => Cats(title: item)));
                                  break;
                                case 'ChatApi_hw2':
                                  Modular.to.pushNamed('/hw2');
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => ChatApiRoom()));
                                  break;
                              }
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
