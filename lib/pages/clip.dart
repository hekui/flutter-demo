import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shop/widgets/clipper/myClipper.dart';

class Clip extends StatefulWidget {
  @override
  _ClipState createState() => _ClipState();
}

class _ClipState extends State<Clip> {
  Widget _box1() {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xfffbb448), Color(0xffe46b10)],
        ),
      ),
    );
  }

  Widget _box2() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xfffbb448), Color(0xffe46b10)],
        ),
      ),
    );
  }

  Widget _clip1() {
    return Container(
      child: Transform.rotate(
        angle: -pi / 3.5,
        child: ClipPath(
          clipper: ClipPainter(),
          child: _box1(),
        ),
      ),
    );
  }

  Widget _clip2() {
    return Container(
      child: ClipPath(
        clipper: MyClipper(),
        child: _box2(),
      ),
    );
  }

  Widget _clip3() {
    return Container(
      child: ClipPath(
        clipper: Love(),
        child: _box2(),
      ),
    );
  }

  Widget _clip4() {
    return Container(
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: _box2(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip'),
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withAlpha(200), Colors.blue[700]],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: _clip1(),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Text(
                        'Clip Demos',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _clip2(),
                    Text(
                      'MyClipper',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _clip3(),
                    Text(
                      'Love',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _clip4(),
                    Text(
                      'BackgroundClipper',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
