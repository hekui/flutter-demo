import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar Demo'),
              background: Image.network(
                'https://picsum.photos/id/392/1334/750',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              )
            ],
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey[300],
                          width: 1,
                          style: BorderStyle.solid)),
                ),
                child: Text('第 ${index + 1} 行'),
              );
            }, childCount: 20),
          )
        ],
      ),
    );
  }
}
