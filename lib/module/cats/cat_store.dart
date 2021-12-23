import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'api_client.dart';
import 'models/cat.dart';

part 'cat_store.g.dart';

class CatStore = _CatStore with _$CatStore;

abstract class _CatStore with Store {
  String url = "https://api.thecatapi.com/v1/images/search?breed_ids=beng";

  @observable
  //чтобы изменения листа учитывались при отрисовке
  ObservableList<Cat> cats = ObservableList.of([]);

  @action
  void fetchNewCat() {
    RestClient restClient = RestClient(Dio());
    restClient.getCats().then((List<Cat> cats) {
      this.cats.add(cats[0]);
    }).catchError((error) {
      print(error.toString());
    });
  }
  @computed
  List<Cat> get  getFilteredCats => cats.where((cat) => cat.width > cat.height).toList();
}
