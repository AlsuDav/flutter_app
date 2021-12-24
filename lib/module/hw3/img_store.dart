import 'dart:math';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mobx/mobx.dart';

import 'models/img.dart';

part 'img_store.g.dart';

class ImgStore = _ImgStore with _$ImgStore;

abstract class _ImgStore with Store {
  @observable
  ObservableList<Img> images = ObservableList.of([]);

  @action
  pickImageFromGallery({Function? addItem}) async {
    XFile? pickedPhoto =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    images.add(Img(
        name: getRandomString(5),
        image: Image.memory(await pickedPhoto!.readAsBytes())));
    images = ObservableList.of(images);
    addItem!();
  }

  @action
  pickImageFromCamera({Function? addItem}) async {
    XFile? pickedPhoto =
    await ImagePicker().pickImage(source: ImageSource.camera);
    images.add(Img(
        name: getRandomString(5),
        image: Image.memory(await pickedPhoto!.readAsBytes())));
    images = ObservableList.of(images);
    addItem!();
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}