// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_app/app_theme.dart';
import 'package:flutter_app/hw2/chat_api_room.dart';
import 'package:flutter_app/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'cats_screen.dart';
import 'chat.dart';
import 'hw2/chat_api.dart';
import 'detail_info.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<ThemeStore>(create: (_) => ThemeStore()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page Yeahhhh'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _items = const ['Widgets', 'Api', 'NiceChat', 'Cats', 'ChatApi'];

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
        // backgroundColor: MyTheme.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: MyTheme.kPrimaryColor,
          title: Text(
            widget.title,
          ),
          actions: [
            GestureDetector(
              child: Icon(Icons.error),

              onTap: () {
                context.read<ThemeStore>().setTheme(ThemeData.dark());
              },
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
                          // if item == _items[1]:
                          switch (item) {
                            case 'Widgets':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Chat(title: item)));
                              break;
                            case 'Api':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ChatApi(title: item)));
                              break;
                            case 'NiceChat':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                              break;
                            case 'Cats':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Cats(title: item)));
                              break;
                            case 'ChatApi':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatApiRoom()));
                              break;
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
                // Row(
                //   children: [
                //     Expanded(
                //         child: TextField(
                //       controller: _textEditingController,
                //     )),
                //     GestureDetector(
                //       child: Icon(Icons.add),
                //       onTap: () {
                //         _addToList(_textEditingController.text);
                //       },
                //     )
                //   ],
                // )
              ],
            ),
          )),
        ));
  }
}
