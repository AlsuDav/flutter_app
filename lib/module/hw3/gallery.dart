import 'package:flutter/material.dart';
import 'package:flutter_app/app_theme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'img_store.dart';
import 'models/img.dart';


class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  static String routeName = '/hw-3';

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final ImgStore _imgStore = Modular.get<ImgStore>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.kPrimaryColor,
        toolbarHeight: 60,
        centerTitle: false,
        title: const Text('Gallery'),
        actions: [
          IconButton(
            onPressed: () {
              _imgStore.pickImageFromGallery(addItem: () {
                _listKey.currentState!
                    .insertItem(_imgStore.images.length - 1);
              });
            },
            icon: const Icon(Icons.image_outlined),
          ),
          IconButton(
              onPressed: () {
                _imgStore.pickImageFromCamera(addItem: () {
                  _listKey.currentState!
                      .insertItem(_imgStore.images.length - 1);
                });
              },
              icon: const Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Observer(
              builder: (context) {
                return AnimatedList(
                  key: _listKey,
                  initialItemCount: _imgStore.images.length,
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    Img img = _imgStore.images[index];
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: const Offset(0, 0),
                      ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.bounceIn,
                          reverseCurve: Curves.bounceOut)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/hw3/detail_info', arguments: img);
                            },
                            child: Center(
                                child: Hero(
                                  tag: img.name,
                                  child: img.image,
                                ))),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}