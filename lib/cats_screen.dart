import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_info.dart';
import 'models/cat.dart';

class Cats extends StatefulWidget {
  const Cats({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _CatsState createState() => _CatsState();
}

class _CatsState extends State<Cats> {

  List<Cat>? _cats = [];

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _getCats();
  }

  Future<void> _getCats() async {
    // var response = await http.get(Uri.parse("https://itis-chat-app-ex.herokuapp.com/chat"));
    var response = await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breeds=true"));
    setState(() {
      _cats = catFromJson(response.body);
    });


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
                        children: _cats?.map((item) {
                          return ListTile(
                            leading: Image.network(item.url),
                              title: Text(
                                item.id,
                                style: const TextStyle(
                                    color: Colors.deepPurple, fontSize: 16),
                              ),
                              onTap: () {

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailInfo(title: item.id)));

                              }

                          );
                        }).toList() ?? [],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                              controller: _textEditingController,
                            )),
                        // GestureDetector(
                        //   child: Icon(Icons.add),
                        //   onTap: () {
                        //     _addToList(_textEditingController.text);
                        //   },
                        // )
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
