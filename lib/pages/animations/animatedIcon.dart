import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedIconPageState();
}

class _AnimatedIconPageState extends State<AnimatedIconPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedIcon'),
      ),
      body: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: animationController,
        ),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    animationController.dispose();
  }
}
