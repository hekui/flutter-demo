import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:shop/api/http.dart';
import 'package:shop/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class StaggeredDemo extends StatefulWidget {
  @override
  _StaggeredDemoState createState() => _StaggeredDemoState();
}

class _StaggeredDemoState extends State<StaggeredDemo> {
  List<ProductModel> productList = [];

  @override
  void initState() {
    print('Index initState');
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchData() async {
    var url = '/api/Products/AogoDeal?maxProdCount=20&token=';
    await Api().get(url).then((dynamic response) {
      var data = response['products'] as List;
      var products = data.map((i) => ProductModel.fromJson(i)).toList();
      if (mounted) {
        setState(() {
          productList = products;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(6),
              height: 320,
              decoration: BoxDecoration(color: Colors.teal[50]),
              child: Center(
                child: Text('Other\'s content'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: new StaggeredGridView.countBuilder(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              itemCount: productList.length,
              itemBuilder: (context, index) =>
                  new _Tile(productList[index], index),
              staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
              // staggeredTileBuilder: (int index) =>
              //     new StaggeredTile.count(2, index.isEven ? 2 : 1),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              child: Center(
                child: SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: new CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  _Tile(this.item, this.index);
  final ProductModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index < 20) {
      return new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                //new Center(child: new CircularProgressIndicator()),
                new Center(
                  child: new FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: item.photos[0].url,
                  ),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.all(6.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(text: 'Price: '),
                            TextSpan(
                                text: item.unitPrice.toString(),
                                style: TextStyle(color: Colors.red[400])),
                          ])),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              size: 14,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('5000',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black26))
                          ],
                        ),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text('No More'),
        ),
      );
    }
  }
}
