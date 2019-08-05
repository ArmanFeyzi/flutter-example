import 'package:flutter/material.dart';
import '../widgets/cat.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Animation<double> catAnimation;
  AnimationController catController;

  initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Project'),
      ),
      body: buildAnimation(),
    );
  }

  Widget buildAnimation(){
    return Cat();
  }

}