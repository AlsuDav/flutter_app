// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImgStore on _ImgStore, Store {
  final _$imagesAtom = Atom(name: '_ImgStore.images');

  @override
  ObservableList<Img> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<Img> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$pickImageFromGalleryAsyncAction =
      AsyncAction('_ImgStore.pickImageFromGallery');

  @override
  Future pickImageFromGallery({Function? addItem}) {
    return _$pickImageFromGalleryAsyncAction
        .run(() => super.pickImageFromGallery(addItem: addItem));
  }

  final _$pickImageFromCameraAsyncAction =
      AsyncAction('_ImgStore.pickImageFromCamera');

  @override
  Future pickImageFromCamera({Function? addItem}) {
    return _$pickImageFromCameraAsyncAction
        .run(() => super.pickImageFromCamera(addItem: addItem));
  }

  @override
  String toString() {
    return '''
images: ${images}
    ''';
  }
}
