import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';


class Repository {
  NewsApiProvider newsProvider = NewsApiProvider();
  NewsDbProvier dbProvier = NewsDbProvier();
}