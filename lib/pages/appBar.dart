import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class AppBarDemo extends StatefulWidget {
  @override
  _AppBarDemoState createState() => _AppBarDemoState();
}

class _AppBarDemoState extends State<AppBarDemo> {
  @override
  Widget build(BuildContext context) {
    double topbarHeight = MediaQueryData.fromWindow(window).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xD93A5BAA), Color(0xD617B1E5)]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: topbarHeight,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      color: Colors.white,
                      tooltip:
                          MaterialLocalizations.of(context).backButtonTooltip,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Hero(
                        tag: 'searchRow',
                        child: SearchBar(),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14),
              color: Colors.teal,
              child: Center(
                child: Text(
                  '页面切换采用 Hero 动画，更多动画请查看 Animations 页面。',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
        child: Container(
          height: 36,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: 6.0,
              ),
              Expanded(
                child: Text(
                  'Search',
                  style: TextStyle(
                    height: 1,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
