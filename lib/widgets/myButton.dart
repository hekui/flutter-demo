import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final double width;
  final double height;

  MyButton({this.text = '', this.pressed, this.width = 80, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: OutlinedButton(
        child: Text(this.text),
        onPressed: this.pressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    );
  }
}
