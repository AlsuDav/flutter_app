import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/module/cats/api_client.dart';
import 'package:flutter_app/theme_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'cat_store.dart';

import 'detail_info.dart';

class Cats extends StatefulWidget {
  const Cats({Key? key, required this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => ThemeStore()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<ThemeStore>().theme,
          home: const Cats(title: 'Flutter Demo Cats')),
    );
  }

  @override
  _CatsState createState() => _CatsState();
}

class _CatsState extends State<Cats> {
  // List<Cat>? _cats = [];
  // String url = "https://api.thecatapi.com/v1/images/search?breed_ids=beng";
  CatStore _catStore = CatStore();

  @override
  void initState() {
    super.initState();
    // _getCatsWithRetrofit();
    _catStore.fetchNewCat();
  }

  // Future<void> _getCats() async {
  //   var response = await http.get(Uri.parse(url));
  //   setState(() {
  //     // _cats = catFromJson(response.body);
  //   });
  // }

  // Future<void> _getCatsWithDio() async {
  //    Dio dio = Dio();
  //
  //   dio
  //       .get(url)
  //       .then((response) => setState(() {
  //             // _cats = catFromJson(jsonEncode(response.data));
  //           }))
  //       .catchError((error) {
  //     print(error.toString());
  //   });
  // }

  // Future<void> _getCatsWithRetrofit() async {
  //   RestClient restClient = RestClient(Dio());
  //   restClient.getCats().then((List<Cat> cats){
  //     setState(() {
  //       this._cats = cats;
  //     });
  //   }).catchError((error){
  //     print(error.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _catStore.fetchNewCat();
          },
          child: Icon(Icons.plus_one),
        ),
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Observer(builder: (context) {
                    return ListView(
                      children: _catStore.getFilteredCats.map((item) {
                        return ListTile(
                          leading: Image.network(item.url),
                          title: Text(
                            item.id,
                            style: const TextStyle(
                                color: Colors.deepPurple, fontSize: 16),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailInfo(title: item.id)));
                          },
                        );
                      }).toList(),
                    );
                  }),
                ),
              ],
            ),
          )),
        ));
  }
}

