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
      duration: Duration(milliseconds: 200),
    );

    catAnimation = Tween(begin: -75.0, end: -20.0).animate(
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
        child:  Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
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
      color: Colors.brown,
      width: 180.0,
      height: 180.0,
    );
  }
}