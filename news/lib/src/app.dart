import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';


class NewsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Beh Nazar',
        onGenerateRoute: (RouteSettings setting){
          route(setting);
        },
      ),
    );
  }

  Route route(RouteSettings setting) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return NewsList();
      }
    );
}
}