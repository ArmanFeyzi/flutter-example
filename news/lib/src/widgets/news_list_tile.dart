import 'dart:async';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';


class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot){
        if (!snapshot.hasData) {
          return Text('Stream still loading data');
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text('Fututre Builder still loading $itemId');
            }

            return buildTile(itemSnapshot.data);
          },
        ); 
      },
    );
  }

  buildTile(ItemModel item) {
    return Card(
      child: ListTile(
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