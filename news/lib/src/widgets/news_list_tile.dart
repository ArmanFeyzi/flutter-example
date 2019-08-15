import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import 'loading_widget.dart';


class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot){
        if (!snapshot.hasData) {
          return LoadingWidget();
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingWidget();
            }

            return buildTile(context, itemSnapshot.data);
          },
        ); 
      },
    );
  }

  buildTile(BuildContext context, ItemModel item) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/${item.id}');
        },
        leading: FlutterLogo(size: 56.0),
        title: Text(item.title),
        subtitle: Text('${item.score} Votes'),
        trailing: Column(
          children: <Widget>[
            Icon(Icons.comment),
            Text('${item.descendants}'),
          ],
        ),
      ),
    );
  }
}