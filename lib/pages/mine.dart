import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/pages/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/account.dart';

// import 'detail.dart';
class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  final contentList = List<Container>.generate(
    30,
    (int i) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey[300], width: 1, style: BorderStyle.solid)),
        ),
        child: Text("Line ${i + 1}"),
      );
    },
  );

  Widget _content(BuildContext context) {
    return Container(
      // height: 1000,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: Colors.teal[200].withOpacity(0.5),
      // ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Card(
            child: GridView.extent(
              shrinkWrap: true,
              maxCrossAxisExtent: 120,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1.3,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.payment,
                        size: 42,
                        color: Colors.red,
                      ),
                      Text('我的优惠券'),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 42,
                        color: Colors.teal,
                      ),
                      Text('我的收藏'),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.directions_walk,
                        size: 42,
                        color: Colors.pink,
                      ),
                      Text('我的足迹'),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list_alt,
                        size: 42,
                        color: Colors.blue,
                      ),
                      Text('我的售后'),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_location_outlined,
                        size: 42,
                        color: Colors.green,
                      ),
                      Text('我的地址管理'),
                    ],
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        size: 42,
                        color: Colors.brown,
                      ),
                      Text('退出登录'),
                    ],
                  ),
                  onTap: () {
                    print('onTap');
                    // Provider.of<AccountModel>(context, listen: false).clean();
                    context.read<AccountModel>().clean();
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('已经退出登录'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '注意：模拟器上无法测试，真机上可验证。',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          var number = 13982271433;
                          var url = "tel:$number";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.phone),
                            SizedBox(width: 8),
                            Text('拨打电话'),
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          var email = '360967863@qq.com';
                          var url =
                              "mailto:$email?subject=News&body=New%20plugin";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            Icon(Icons.email_outlined),
                            SizedBox(width: 8),
                            Text('发送邮件'),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.list,
                  ),
                  title: Text('我的工单'),
                  horizontalTitleGap: -6,
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('我的工单'),
                  horizontalTitleGap: -6,
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('我的工单'),
                  horizontalTitleGap: -6,
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('我的工单'),
                  horizontalTitleGap: -6,
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('我的工单'),
                  horizontalTitleGap: -6,
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var account = context.watch<AccountModel>();
    // return Login();
    if (account.userId == null) {
      return Login();
    } else {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverCustomHeaderDelegate(
                title: account.nickname,
                collapsedHeight: 40,
                expandedHeight: 240,
                paddingTop: MediaQuery.of(context).padding.top,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([_content(context)],
                  semanticIndexOffset: 50),
            ),
          ],
        ),
      );
    }
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  String statusBarMode = 'light';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 30 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 30 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    if (shrinkOffset > 30) {
      return Colors.blue;
      // return Theme.of(context).primaryColor;
    } else {
      return Colors.transparent;
    }
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset > 30) {
      return Colors.white;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    // print('shrinkOffset $shrinkOffset');

    var account = context.watch<AccountModel>();

    return Container(
      // color: Colors.teal,
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          // 这里不定位，可实现另一种效果，圆形背景会等待滚动到一定距离后才跟随一起滚动。
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                // color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue[500].withOpacity(0.5),
                    Colors.blue[500],
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            // top: this.maxExtent - shrinkOffset - 200,
            bottom: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          image: DecorationImage(
                            image: NetworkImage('https://picsum.photos/50/50'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              account.nickname,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              account.desc,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('我的订单'),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 0, right: 8, bottom: 8, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Icon(
                                        Icons.payment,
                                        size: 36,
                                        color: Colors.grey[600],
                                      ),
                                      Text('待付款'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: Ink(
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.all(
                                  //     Radius.circular(10),
                                  //   ),
                                  // ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Column(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Icon(
                                          Icons.local_shipping_outlined,
                                          size: 36,
                                          color: Colors.grey[600],
                                        ),
                                        Text('待发货'),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Icon(
                                        Icons.wallet_giftcard,
                                        size: 36,
                                        color: Colors.grey[600],
                                      ),
                                      Text('待收货'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Icon(
                                        Icons.add_comment_outlined,
                                        size: 36,
                                        color: Colors.grey[600],
                                      ),
                                      Text('待评价'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // appBar
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
