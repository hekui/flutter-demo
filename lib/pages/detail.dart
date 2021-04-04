import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  // var data = {

  // }

  // 选择弹框
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        //圆角
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (BuildContext context) {
        return ModalContent();
      },
    );
  }

  // tab 切换
  int _tabId = 1;
  void _handleTabBar(int newValue) {
    setState(() {
      _tabId = newValue;
    });
  }

  final String desc = '介绍\n好吃的很\n巴适得板\n快点来买哦' 'aaa';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print('args $args');

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
              _showModalBottomSheet(context);
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
        appBar: AppBar(
          title: Text("商品详情"),
        ),
        body: ListView(
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
            DetailTabBar(
              tabId: _tabId,
              onChanged: _handleTabBar,
            ),
            DetailTabBarView(tabId: _tabId),
            // Container(
            //   child: TabBar(
            //     labelColor: Colors.blue,
            //     unselectedLabelColor: Colors.black38,
            //     controller: this.tabController,
            //     tabs: [Tab(text: '图文详情'), Tab(text: '质检报告')],
            //   ),
            // ),
            // Container(
            //   height: 500,
            //   child: TabBarView(
            //     controller: this.tabController,
            //     children: [
            //       Center(
            //         // padding: EdgeInsets.all(16),
            //         child: Text(desc),
            //       ),
            //       Center(
            //         // padding: EdgeInsets.all(16),
            //         child: Text('质检报告内容'),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ));
  }
}

// TabBar
class DetailTabBar extends StatelessWidget {
  DetailTabBar({Key key, this.tabId: 1, @required this.onChanged})
      : super(key: key);

  final ValueChanged<int> onChanged;

  final int tabId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              onChanged(1);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                              tabId == 1 ? Colors.black45 : Colors.black12))),
              child: Text('图文详情',
                  style: TextStyle(
                      color: tabId == 1 ? Colors.black87 : Colors.black45)),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              onChanged(2);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color:
                              tabId == 2 ? Colors.black45 : Colors.black12))),
              child: Text('质检报告',
                  style: TextStyle(
                      color: tabId == 2 ? Colors.black87 : Colors.black45)),
            ),
          ),
        ),
      ],
    );
  }
}

// TabBarView
class DetailTabBarView extends StatelessWidget {
  DetailTabBarView({
    Key key,
    this.tabId: 1,
  }) : super(key: key);
  final int tabId;

  final String desc = '介绍\n好吃的很\n巴适得板\n快点来买哦' 'aaa';

  Widget build(BuildContext context) {
    if (tabId == 1) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Text(desc),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(16),
        child: Text('质检报告内容'),
      );
    }
  }
}

class ModalContent extends StatefulWidget {
  ModalContent({
    Key key,
    this.curSkuId: 0,
  }) : super(key: key);

  final int curSkuId;

  @override
  _ModalContentState createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  // int _curSkuId = widget.curSkuId;

  final skuList = [
    {
      'id': 1,
      'skuName': '青城山生态蛋',
      'sellPrice': 9600,
      'headImage':
          'https://wechatmsg.fangguancha.com/product/product/202103/1615170053116.jpg'
    },
    {
      'id': 2,
      'skuName': '托装 30枚/托 6托 青城山粗粮蛋',
      'sellPrice': 9700,
      'headImage':
          'https://wechatmsg.fangguancha.com/product/product/202103/1615170043598.jpg'
    },
    {
      'id': 3,
      'skuName': '托装 30枚/托 6托 好鲜见',
      'sellPrice': 9800,
      'headImage':
          'https://wechatmsg.fangguancha.com/product/product/202103/1615169993092.jpg'
    },
    {
      'id': 4,
      'skuName': '托装 30枚/托 6托 好鲜见1',
      'sellPrice': 9800,
      'headImage':
          'https://wechatmsg.fangguancha.com/product/product/202103/1615169993092.jpg'
    },
    {
      'id': 5,
      'skuName': '托装 30枚/托 6托 好鲜见2',
      'sellPrice': 9800,
      'headImage':
          'https://wechatmsg.fangguancha.com/product/product/202103/1615169993092.jpg'
    },
  ];
  var curSku = {
    'id': 1,
    'skuName': '青城山生态蛋',
    'sellPrice': 9600,
    'headImage':
        'https://wechatmsg.fangguancha.com/product/product/202103/1615170053116.jpg'
  };

  Widget buildSkuBtnsList() {
    List<Widget> tiles = [];
    for (var item in skuList) {
      tiles.add(TextButton(
          child: Text(item['skuName']),
          onPressed: () {
            // print(item);
            setState(() {
              curSku = item;
            });
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black87),
              backgroundColor: curSku['id'] == item['id']
                  ? MaterialStateProperty.all(Colors.yellow)
                  : MaterialStateProperty.all(Colors.grey[200]))));
    }
    return Wrap(
      spacing: 10,
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    // price formater
    int sellPrice = curSku['sellPrice'] ??= 0;
    double price = (sellPrice / 100);
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: price);
    String priceStr = fmf.output.nonSymbol;

    return Container(
        constraints: BoxConstraints(
          minHeight: 260, maxHeight: 560,
          // maxHeight: MediaQuery.of(context).size.height / 1.5,
        ),
        // height: 390,
        // color: Colors.white,
        child: Stack(
          children: [
            // Container(
            //   height: 30.0,
            //   width: double.infinity,
            //   color: Colors.black54,
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(25),
            //         topRight: Radius.circular(25),
            //       )),
            // ),
            Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 58),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 96,
                          height: 96,
                          color: Colors.grey[200],
                          margin: EdgeInsets.only(right: 10),
                          child: Image.network(
                            curSku['headImage'],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          child: Text(
                            '￥$priceStr',
                            style: TextStyle(
                              color: Colors.red[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text('规格'),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    constraints: BoxConstraints(
                      maxHeight: 180,
                    ),
                    child: SingleChildScrollView(
                      child: buildSkuBtnsList(),
                    ),
                  ),
                ],
              ),
            ),
            // submit btn
            Positioned(
              child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('确定'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all(0),
                          minimumSize: MaterialStateProperty.all(Size(240, 44)),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                        ),
                      ),
                    ],
                  )),
              bottom: 0,
              left: 0,
              right: 0,
            )
          ],
        ));
  }
}
