import 'package:flutter/material.dart';

class SliverAppBarDemo2 extends StatefulWidget {
  @override
  _SliverAppBarDemo2State createState() => _SliverAppBarDemo2State();
}

class _SliverAppBarDemo2State extends State<SliverAppBarDemo2>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  List<Widget> _buildContent(String prefix) {
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
    final TextStyle propSubTitle = TextStyle(
      fontSize: 12,
      color: Colors.grey[600],
    );

    Widget _buildProp = Container(
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                Text(
                  '规格',
                  style: propSubTitle,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('托装 30枚/托 6托 好鲜见')
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
            ),
            onTap: () {
              // _showModalBottomSheet(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                Text(
                  '参数',
                  style: propSubTitle,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('鸡蛋种类：白壳红心')
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text(
                  '配送',
                  style: propSubTitle,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('快递 - 19:00前下单，预计明日送达 ')
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, bool) {
        return [
          // SliverAppBar(
          //   pinned: true,
          //   elevation: 0,
          //   expandedHeight: 300,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('SliverAppBar Demo1'),
          //     collapseMode: CollapseMode.pin,
          //     background: Image.network(
          //       'https://picsum.photos/id/392/1334/750',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.share),
          //       onPressed: () {},
          //     )
          //   ],
          // ),
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar Demo2'),
            ),
          ),
          SliverToBoxAdapter(
            // child: Container(
            //   height: 375,
            //   child: Image.network(
            //     'https://wechatmsg.fangguancha.com/product/product/202103/1615169993092.jpg',
            //     fit: BoxFit.fill,
            //   ),
            // ),
            child: Column(
              children: [
                Container(
                  height: 375,
                  child: Image.network(
                    'https://wechatmsg.fangguancha.com/product/product/202103/1615169993092.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            '好鲜见精品白壳红心蛋托装（不含纸箱）',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '￥19.88',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.red[500],
                                ),
                              ),
                            ),
                            Text('已售 1220'),
                          ],
                        ),
                      ],
                    )),
                Container(
                  color: Colors.grey[300],
                  height: 6,
                ),
                _buildProp,
                Container(
                  color: Colors.grey[300],
                  height: 6,
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.blue,
                controller: this.tabController,
                tabs: [Tab(text: 'Tab1'), Tab(text: 'Tab2')],
              ),
            ),
          ),
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
    print('shrinkOffset $shrinkOffset');
    return Material(
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
