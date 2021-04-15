import 'package:flutter/material.dart';

class PageRoute1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面切换动画'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('从底部滑上来!'),
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
            ),
            ElevatedButton(
              child: Text('淡入出来!'),
              onPressed: () {
                Navigator.of(context).push(_createRoute2());
              },
            ),
            ElevatedButton(
              child: Text('放大出来!'),
              onPressed: () {
                Navigator.of(context).push(_createRoute3());
              },
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PageRoute2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PageRoute2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.ease;
      var tween = Tween<double>(begin: 0, end: 1)
          .chain(CurveTween(curve: curve))
          .animate(animation);
      return FadeTransition(
        opacity: tween,
        child: child,
      );
    },
  );
}

Route _createRoute3() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PageRoute2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.ease;

      var tween = Tween<double>(begin: 0, end: 1.0)
          .chain(CurveTween(curve: curve))
          .animate(animation);
      return ScaleTransition(
        scale: tween,
        alignment: Alignment.center,
        // alignment: Alignment.topLeft,
        child: child,
      );
    },
  );
}

class PageRoute2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        color: Colors.teal,
        child: Center(
          child: Text('Page 2'),
        ),
      ),
    );
  }
}
