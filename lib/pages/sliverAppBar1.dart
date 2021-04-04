import 'package:flutter/material.dart';

class SliverAppBarDemo1 extends StatefulWidget {
  @override
  _SliverAppBarDemo1State createState() => _SliverAppBarDemo1State();
}

class _SliverAppBarDemo1State extends State<SliverAppBarDemo1>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  _buildContent(String prefix) {
    return List<Container>.generate(
      30,
      (int i) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey[300],
                    width: 1,
                    style: BorderStyle.solid)),
          ),
          child: Text("$prefix Line ${i + 1}"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, bool) {
        return [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar Demo1'),
              collapseMode: CollapseMode.pin,
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
          SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                  child: TabBar(
                labelColor: Colors.blue,
                controller: this.tabController,
                tabs: [Tab(text: 'Tab1'), Tab(text: 'Tab2')],
              ))),
        ];
      },
      body: TabBarView(
        controller: this.tabController,
        children: [
          ListView(children: _buildContent('Tab1')),
          ListView(children: _buildContent('Tab2')),
        ],
      ),
    ));
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
