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

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      )
    );

  }

  onTap(){
    if(catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if(catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Project'),
      ),
      body: GestureDetector(
        child: buildAnimation(),
        onTap: onTap,
      ),
    );
  }

  Widget buildAnimation(){
    return AnimatedBuilder(
      child: Cat(),
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      },
      animation: catAnimation,
    );
  }

}