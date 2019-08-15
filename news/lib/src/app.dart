import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';


class NewsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Beh Nazar',
        home: NewsList(),
      ),
    );
  }
}