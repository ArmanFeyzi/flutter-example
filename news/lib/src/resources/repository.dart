import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';


class Repository {
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsDbProvier dbProvier = NewsDbProvier();

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopID();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await dbProvier.fetchItem(id);
    if (item !=null){
      return item;
    }

    item = await apiProvider.fetchItem(id);
    await dbProvier.addItem(item);

    return item;
  }

}