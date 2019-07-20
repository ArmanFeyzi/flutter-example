import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModels> images;

  ImageList(this.images);

  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModels image){
    return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, style: BorderStyle.solid, width: 3)
          ),
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Padding( 
                child: Image.network(image.url),
                padding: EdgeInsets.only(bottom: 12.0),
              ),
              Text(image.title),
            ],
          )
        );
  }
}