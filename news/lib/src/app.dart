import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';
import 'blocs/comments_provider.dart';


class NewsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'Beh Nazar',
          onGenerateRoute: route,
        ),
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
          final commentBloc = CommentsProvider.of(context);
          final itemId = int.parse(setting.name.replaceFirst('/', ''));

          commentBloc.fetchItemWithComments(itemId);

          return NewsDetail(
            itemId: itemId,
          );
        }
      );
    }
    
}
}