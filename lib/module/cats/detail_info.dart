import 'package:flutter/material.dart';
import 'package:flutter_app/theme_store.dart';
import 'package:provider/provider.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            child: Icon(Icons.error),
            onTap: () {
              context.read<ThemeStore>().setTheme(ThemeData.dark());
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
