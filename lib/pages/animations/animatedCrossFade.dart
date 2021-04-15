import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage>
    with TickerProviderStateMixin {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFadePage'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: Text('切换'),
            onPressed: () {
              setState(() {
                _showFirst = !_showFirst;
              });
            },
          ),
          Center(
            child: AnimatedCrossFade(
              duration: Duration(seconds: 1),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Text(
                  'first child',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              secondChild: Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'second child',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.blue,
          ),
          Center(
            child: AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                width: 150,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'first child',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              secondChild: Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'second child',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // layoutBuilder: (child1, key1, child2, key2) {
              //   return Stack(
              //     // overflow: Overflow.visible,
              //     alignment: Alignment.center,
              //     children: <Widget>[
              //       Positioned(
              //         top: 0,
              //         bottom: 0,
              //         key: key2,
              //         child: child2,
              //       ),
              //       Positioned(
              //         key: key1,
              //         child: child1,
              //       ),
              //     ],
              //   );
              // },
            ),
          ),
          Container(
            width: 300,
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
