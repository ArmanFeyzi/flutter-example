import 'package:flutter/material.dart';
import 'screens/news_list.dart';


class NewsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beh Nazar',
      home: NewsList(),
    );
  }
}