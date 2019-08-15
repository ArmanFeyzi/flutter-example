import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget build(BuildContext context) {
    // By use this BLOC we can render top ids in app
    // .of() method help us to access availabel SotresProvider and StoreBloc in all entire app
    // (context) by this 'context' we can access all BLOC hiracy 
    final bloc = StoriesProvider.of(context);

    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tejarat News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>>snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Text('${snapshot.data[index]}');
          },
        );
      },
    );
  }
}