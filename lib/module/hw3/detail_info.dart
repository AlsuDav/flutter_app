import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_theme.dart';

import 'models/img.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key, required this.img}) : super(key: key);

  final Img img;

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.kPrimaryColor,
        toolbarHeight: 60,
        centerTitle: false,
        title: Text(
          widget.img.name,
        ),
      ),
      body: SafeArea(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Hero(
                      tag: widget.img.name,
                      child: InteractiveViewer(child: widget.img.image))))),
    );
  }
}