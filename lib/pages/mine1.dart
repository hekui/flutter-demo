import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'detail.dart';

class Mine1 extends StatefulWidget {
  @override
  _Mine1State createState() => _Mine1State();
}

class _Mine1State extends State<Mine1> {
  Widget _content() {
    return Container(
      // height: 1000,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: Colors.teal[200].withOpacity(0.5),
      // ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Card(
            child: Container(
              height: 100,
              child: Row(
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
                          'Hekui',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '前端开发工程师，热爱Flutter',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 15,
                  ),
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
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.payment,
                            size: 36,
                            color: Colors.grey[600],
                          ),
                          Text('待付款'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 36,
                            color: Colors.grey[600],
                          ),
                          Text('待发货'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.wallet_giftcard,
                            size: 36,
                            color: Colors.grey[600],
                          ),
                          Text('待收货'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_comment_outlined,
                            size: 36,
                            color: Colors.grey[600],
                          ),
                          Text('待评价'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
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
                        Icons.settings,
                        size: 42,
                        color: Colors.brown,
                      ),
                      Text('设置'),
                    ],
                  ),
                  onTap: () {},
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
                        '注意：模拟器上无法测试。',
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
                          var number = 13982271436;
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
    return Container(
      child: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xD93A5BAA), Color(0xD617B1E5)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: _content(),
              )
            ],
          )
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: Text('Mine'),
      //   toolbarHeight: 0,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xD93A5BAA), Color(0xD617B1E5)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              _content(),
            ],
          )
        ],
      ),
    );
  }
}
