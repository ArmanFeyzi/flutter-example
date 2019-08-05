import 'package:flutter/material.dart';
import '../widgets/cat.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  initState(){
    super.initState();

    catController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
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