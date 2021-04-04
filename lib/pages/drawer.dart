import 'package:flutter/material.dart';

class DrawerDemo extends StatefulWidget {
  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // 自定义抽屉宽度
    final double widthPercent = 0.9;
    final double _width = MediaQuery.of(context).size.width * widthPercent;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Drawer'),
        leading: BackButton(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              width: 200,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: _closeDrawer, child: Text('Close Drawer'))
                ],
              ),
            )
          ],
        ),
      ),
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints.expand(width: _width),
        child: Container(
          width: 200,
          color: Colors.teal[100],
          child: Center(
            child: Text('自定义抽屉'),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _openDrawer, child: Text('Open Drawer by Key')),
            Builder(
              builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Text('Open Drawer by of(context)'));
              },
            )
          ],
        ),
      ),
    );
  }
}
