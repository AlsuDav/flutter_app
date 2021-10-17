import 'package:flutter/material.dart';

import 'detail_info.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<String> _items = ['message 1', 'message 2'];

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
                      child: ListView(
                        children: _items.map((item) {
                          return ListTile(
                            title: Text(
                              item,
                              style: const TextStyle(
                                  color: Colors.deepPurple, fontSize: 16),
                            ),
                            onTap: () {

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailInfo(title: item)));

                              }

                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: _textEditingController,
                        )),
                        GestureDetector(
                          child: Icon(Icons.add),
                          onTap: () {
                            _addToList(_textEditingController.text);
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
