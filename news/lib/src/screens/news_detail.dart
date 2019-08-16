import 'dart:async';
import '../models/item_model.dart';
import 'package:flutter/material.dart';
import '../blocs/comments_provider.dart';


class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  Widget build(BuildContext context) {
    final bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tejarat News'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot){
        if (!snapshot.hasData){
          return Text('LOADING....');
        }

        final itemFuture = snapshot.data[itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text(' COMMENT DATA LOADING ....');
            }

            return buildList(itemSnapshot.data, snapshot.data);
          },
        );
      },
    );
  }

  Widget buildList(ItemModel item, Map<int, Future<ItemModel>> itemMap) {
    return ListView(
      children: <Widget>[
        buildTitle(item),
      ],
    );
  }

  Widget buildTitle(ItemModel item){
    return Container(
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blueGrey[700],
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10.0), 
    );
  }

}