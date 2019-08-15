import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';


class NewsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Beh Nazar',
        onGenerateRoute: route,
      ),
    );
  }

  Route route(RouteSettings setting) {
    if (setting.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return NewsList();
        }
      );
    } else {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final itemId = int.parse(setting.name.replaceFirst('/', ''));
          return NewsDetail(
            itemId: itemId,
          );
        }
      );
    }
    
}
}