import 'package:flutter/material.dart';
import './../router/routers.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        child: Text('Detail1'),
        onPressed: () {
          Navigator.pushNamed(context, Routers.detail,
              arguments: {'id': 'home'});
        },
      ),
    );
  }
}
