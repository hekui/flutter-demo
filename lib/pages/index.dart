import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart';
import 'package:shop/api/http.dart';
import 'package:shop/models/account.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/app.dart';
// import 'package:shop/widgets/demo.dart';
// import '../widgets/swiperIndex.dart';
import './../router/routers.dart';
// import './../pages/detail.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/cupertino.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<ProductModel> aogoDeals = [];

  @override
  void initState() {
    print('Index initState');
    super.initState();
    loadAogoDeals();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadAogoDeals() async {
    var url = '/api/Products/AogoDeal?maxProdCount=6&token=';
    await Api().get(url).then((dynamic response) {
      var data = response['products'] as List;
      var products = data.map((i) => ProductModel.fromJson(i)).toList();
      if (mounted) {
        setState(() {
          aogoDeals = products;
        });
      }
    });
  }

  Widget textSection = Container(
    padding: EdgeInsets.all(16),
    child: Text(
        '如果你恰好是一名前端工程师，且对 Flutter 感兴趣，那么真的是太好了，这篇文章完全就是为你准备的。写惯了 HTML、CSS 与 JavaScript,要不要来是试试 Dart？如果你不熟悉 Flutter 但仍对其感兴趣，可以先看看「让我们在2019年重新认识 Flutter」一文了解些 Flutter 基础。'),
  );

  List<Map> swiper = [
    {
      'goodsId': 1,
      'img': 'https://picsum.photos/250?image=1',
    },
    {
      'goodsId': 2,
      'img': 'https://picsum.photos/250?image=2',
    },
    {
      'goodsId': 3,
      'img': 'https://picsum.photos/250?image=3',
    },
    {
      'goodsId': 4,
      'img': 'https://picsum.photos/250?image=4',
    },
  ];

  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    // var data = MediaQuery.of(context);
    // print('MediaQueryData $data');

    var account = context.watch<AccountModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      // appBar: PreferredSize(
      //   child: Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           colors: [Colors.yellow, Colors.transparent],
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter),
      //     ),
      //     child: SafeArea(child: Text('Home')),
      //   ),
      //   preferredSize: Size(double.infinity, 60),
      // ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          children: <Widget>[
            // SwiperIndex(dataList: swiper),
            _buildSwiper(swiper),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(account.userId == null
                      ? '您还没有登录，请进入 MY 页面进行登录。'
                      : '欢迎您，${account.nickname}。'),
                  ElevatedButton(
                    child: Text('Detail inner'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.detail,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black26)),
                    child: Text('Full screen'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.fullscreen,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Sliver App Bar'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.sliverAppBar,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Sliver App Bar with Tab'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.sliverAppBar1,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Sliver App Bar with Tab2'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.sliverAppBar2,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Sliver Header (default no title)'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.sliverHeader,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Form 表单'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.textField,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Staggered （瀑布流）'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.staggered,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('StaggeredDemo （瀑布流实例）'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.staggeredDemo,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Drawer Demo'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.drawer,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('AppBar Demo (Custom, Search Page)'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.appbar,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Clip'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.clip,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Animations'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.animations,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Animation - AnimatedCrossFadePage'),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routers.animatedCrossFadePage,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Animation - AnimatedIcon'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.animatedIcon,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('Animation - pageRoute'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.animationPageRoute,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('常见首页布局，搜索，菜单吸顶（带动画）'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.indexLayout,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('布局 - GridView 混合布局'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.gridViewLayout,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('布局 - Border'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.borderLayout,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('布局 - 左右滑动切换页面（PageView）'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.pageviewLayout,
                          arguments: {'id': 'home'});
                    },
                  ),
                  ElevatedButton(
                    child: Text('GenerateRoute'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/aaa');
                    },
                  ),
                  ElevatedButton(
                    child: Text('Go My Page (TODO)'),
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.root,
                          arguments: AppArguments(3));
                    },
                  ),
                ],
              ),
            ),
            textSection,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ExpansionPanelList(
                // elevation: 0,
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text('我是可展开的'),
                      );
                    },
                    body: Padding(
                      padding: EdgeInsets.all(0),
                      child: textSection,
                    ),
                    isExpanded: _isExpanded,
                    canTapOnHeader: true,
                  ),
                ],
                expandedHeaderPadding: EdgeInsets.all(0),
                dividerColor: Colors.blue,
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _isExpanded = !isExpanded;
                  });
                },
                animationDuration: kThemeAnimationDuration,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      Chip(
                        label: Text('Chip'),
                      ),
                      Chip(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        avatar: Icon(
                          Icons.account_box,
                          color: Colors.grey,
                        ),
                        label: Text('Chip'),
                        // labelPadding: EdgeInsets.all(0),
                        deleteIcon: Icon(Icons.delete),
                        deleteIconColor: Colors.grey,
                        onDeleted: () {},
                      ),
                      Chip(
                        label: Text('Chip'),
                        backgroundColor: Colors.teal[100],
                        elevation: 5,
                        shadowColor: Colors.red,
                        side: BorderSide(),
                      ),
                      ActionChip(label: Text('ActionChip'), onPressed: () {})
                    ],
                  ),
                  ElevatedButton(
                    child: Text('Show CupertinoActionSheet'),
                    onPressed: () {
                      _showCupertinoActionSheet();
                    },
                  ),
                ],
              ),
            ),
            textSection,
            textSection,
            textSection,
            // Container(
            //   child: Image.network('https://picsum.photos/250?image=9'),
            // )
          ],
        ),
      ),
    );
  }

  _showCupertinoActionSheet() async {
    var result = await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text('提示'),
          message: Text('是否要删除当前项？'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('删除'),
              onPressed: () {
                Navigator.of(context).pop('delete');
              },
              isDefaultAction: true,
            ),
            CupertinoActionSheetAction(
              child: Text('暂时不删'),
              onPressed: () {
                Navigator.of(context).pop('not delete');
              },
              isDestructiveAction: true,
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('取消'),
            onPressed: () {
              Navigator.of(context).pop('cancel');
            },
          ),
        );
      },
    );
    print('$result');
  }

  Future<void> _onRefresh() async {
    print('onRefresh');
    await loadAogoDeals();
  }

  Widget _buildSwiper(dynamic dataList) {
    void _goDetail(int index) {
      Navigator.pushNamed(context, Routers.detail, arguments: {
        'from': '_buildSwiper',
        'id': dataList[index]['goodsId'],
      });
    }

    List<Widget> _paginationList(int count, int activeIndex) {
      List<Widget> list = [];
      for (var i = 0; i < count; i++) {
        list.add(AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: activeIndex == i ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: activeIndex == i ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ));
      }
      return list;
    }

    SwiperPagination _pagination(int count) {
      return SwiperPagination(
        // builder: DotSwiperPaginationBuilder(
        //   color: Colors.grey,
        //   // activeColor: Colors.teal,
        // ),
        builder: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            return Align(
              alignment: Alignment.bottomCenter,
              // child: Container(
              //   margin:
              //       const EdgeInsets.only(left: 60, right: 60, bottom: 10),
              //   child: LinearProgressIndicator(
              //     value: (config.activeIndex + 1) / config.itemCount,
              //     valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              //   ),
              // ),
              child: Wrap(
                spacing: 6,
                children: _paginationList(count, config.activeIndex),
              ),
            );
          },
        ),
      );
    }

    return Container(
      height: 300,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                _goDetail(index);
              },
              // onTap: () {
              //   Navigator.pushNamed(context, Routers.detail, arguments: {
              //     'id': dataList[index]['goodsId'],
              //   });
              //   // can work
              //   // Navigator.push(
              //   //     context, MaterialPageRoute(builder: (context) => Detail()));
              // },
              // child: Image.network('${dataList[index]['img']}', fit: BoxFit.fill),
              child: Stack(
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: dataList[index]['img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ));
        },
        itemCount: dataList.length,
        pagination: _pagination(dataList.length),
        // autoplay: true,
      ),
      // height: 300,
      // child: new Swiper(
      //   itemBuilder: (BuildContext context, int index) {
      //     return new Image.network(
      //       "https://picsum.photos/250?image=9",
      //       fit: BoxFit.fill,
      //     );
      //   },
      //   itemCount: 10,
      //   viewportFraction: 0.8,
      //   scale: 0.9,
      // ),
    );
  }

  // Widget _buildDemo() {
  //   return Container(
  //     padding: EdgeInsets.all(16),
  //     child: ElevatedButton(
  //       child: Text('Detail buildDemo'),
  //       onPressed: () {
  //         Navigator.pushNamed(context, Routers.detail,
  //             arguments: {'id': 'home'});
  //       },
  //     ),
  //   );
  // }
}
