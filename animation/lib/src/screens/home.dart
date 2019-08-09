import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  initState(){
    super.initState();

    // Box Animation & Controller
    boxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    boxAnimation = Tween(
      begin: pi * 0.6, 
      end: pi * 0.7
    )
    .animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOut,
      )
    );
    boxAnimation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });

    // Cat Animation & Controller
    catController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    catAnimation = Tween(begin: -82.0, end: -20.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      )
    );

  }

  onTap(){
    if(catController.status == AnimationStatus.completed) {
      catController.reverse();
      boxController.stop();
    } else if(catController.status == AnimationStatus.dismissed) {
      catController.forward();
      boxController.forward();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Project'),
      ),
      body: GestureDetector(
        child:  Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation(){
    return AnimatedBuilder(
      child: Cat(),
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      animation: catAnimation,
    );
  }

  Widget buildBox() {
    return Container(
      color: Colors.purple[300],
      width: 200.0,
      height: 200.0,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 4.0,
      top: 1.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          color: Colors.purple[300],
          width: 125.0,
          height: 10.0,
        ),
        builder: (context, child) {
          return Transform.rotate(
            child: child,
            angle: boxAnimation.value,
            alignment: Alignment.topLeft,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 4.0,
      top: 1.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          color: Colors.purple[300],
          width: 125.0,
          height: 10.0,
        ),
        builder: (context, child) {
          return Transform.rotate(
            child: child,
            angle: -boxAnimation.value,
            alignment: Alignment.topRight,
          );
        },
      ),
    );
  }

}