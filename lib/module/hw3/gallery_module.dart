
import 'package:flutter_app/module/hw3/gallery.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail_info.dart';
import 'img_store.dart';


class GalleryModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ImgStore())];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const Gallery(),
        transition: TransitionType.leftToRightWithFade),
    ChildRoute('/detail_info',
        child: (context, args) => DetailInfo(img: args.data),
        transition: TransitionType.leftToRightWithFade)
  ];
}