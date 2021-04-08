import 'package:flutter/material.dart';

class IndexLayout extends StatefulWidget {
  @override
  _IndexLayoutState createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: Text('常见首页布局'),
      //   flexibleSpace: Container(
      //     height: 500,
      //     color: Colors.blue,
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(),
          SliverAppBar(
            pinned: true,
            leading: null,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('常见首页布局'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('这里是一些内容（比如Banner）。'),
                  Text('下面的菜单滚动到顶部后会吸顶。'),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyBarDelegate(
              paddingTop: MediaQuery.of(context).padding.top,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class StickyBarDelegate extends SliverPersistentHeaderDelegate {
  // final Widget child;
  final double paddingTop;

  StickyBarDelegate({
    // @required this.child,
    this.paddingTop = 24,
  });

  @override
  double get maxExtent => 60 + paddingTop;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print('shrinkOffset $shrinkOffset');
    return Container(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.only(top: paddingTop),
      color: Colors.white,
      padding: EdgeInsets.all(6),
      child: Material(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.black.withOpacity(0.12),
                highlightColor: Colors.transparent,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      Text('Home')
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Colors.grey,
                    ),
                    Text('Snow')
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_alarm,
                      color: Colors.grey,
                    ),
                    Text('Time')
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance,
                      color: Colors.grey,
                    ),
                    Text('Build')
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
