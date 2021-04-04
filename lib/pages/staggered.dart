import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
      (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class Staggered extends StatelessWidget {
  Staggered() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 20;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('random dynamic tile sizes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: new StaggeredGridView.countBuilder(
              primary: false,
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              itemCount: _sizes.length + 1,
              itemBuilder: (context, index) => new _Tile(index, _sizes),
              staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
            ),
          ),
        ],
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Container(
      //         height: 320,
      //         decoration: BoxDecoration(color: Colors.teal[50]),
      //         child: Center(
      //           child: Text('Other\'s content'),
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: new StaggeredGridView.countBuilder(
      //         primary: false,
      //         shrinkWrap: true,
      //         crossAxisCount: 4,
      //         mainAxisSpacing: 4.0,
      //         crossAxisSpacing: 4.0,
      //         itemCount: _sizes.length + 1,
      //         itemBuilder: (context, index) => new _Tile(index, _sizes),
      //         staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      //       ),
      //     ),
      //   ],
      // )
    );
  }
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  _Tile(this.index, this.sizes);

  final List sizes;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index < 20) {
      IntSize size = sizes[index];
      return new Card(
        child: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                //new Center(child: new CircularProgressIndicator()),
                new Center(
                  child: new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        'https://picsum.photos/${size.width}/${size.height}/',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    'Image number $index',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    'Width: ${size.width}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  new Text(
                    'Height: ${size.height}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 120,
        child: Center(
          child: Text('No More'),
        ),
      );
    }
  }
}
