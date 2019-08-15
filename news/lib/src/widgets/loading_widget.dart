import 'package:flutter/material.dart';


class LoadingWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: loadingBox(),
        subtitle: loadingBox(),
        trailing: Column(
          children: <Widget>[
            Icon(Icons.search)
          ],
        ),
      ),
    );
  }

  Widget loadingBox() {
    return Container(
      color: Colors.grey[200],
      height: 25.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }
}