import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'search.dart';

class AnimationsDemo extends StatefulWidget {
  @override
  _AnimationsDemoState createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
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
              colors: [Color(0xD93A5BAA), Color(0xD617B1E5)],
            ),
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
                      // child: Hero(
                      //   tag: 'searchRow',
                      //   child: _SearchBar(),
                      // ),
                      child: Card(
                        child: OpenContainer<bool>(
                          transitionType: ContainerTransitionType.fade,
                          openBuilder: (BuildContext context, VoidCallback _) {
                            return SearchPage();
                          },
                          // onClosed: onClosed,
                          tappable: false,
                          closedBuilder: (BuildContext context,
                              VoidCallback openContainer) {
                            return _SearchBar(openContainer: openContainer);
                          },
                        ),
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
              color: Colors.teal,
              child: Center(
                child: Text(
                  'Content',
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

class _SearchBar extends StatelessWidget {
  const _SearchBar({this.openContainer});
  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.pushNamed(context, '/search');
      // },
      onTap: openContainer,
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
    );
  }
}
