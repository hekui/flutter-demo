import 'package:flutter/material.dart';

class Fullscreen extends StatefulWidget {
  @override
  _FullscreenState createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage('https://picsum.photos/id/287/1334/750'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
        appBar: AppBar(
          backgroundColor: Colors.transparent, //把appbar的背景色改成透明
          elevation: 0, // appbar的阴影
          title: Text('Fullscreen'),
        ),
        body: Center(
          child: Text('全屏背景图效果'),
        ),
      ),
    );
  }
}
