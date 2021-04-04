import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animations/animations.dart';

import 'package:shop/models/account.dart';
import './index.dart';
import './catalog.dart';
import './cart.dart';
import './mine.dart';
// import './mine1.dart';

class AppArguments {
  final int tabId;

  AppArguments(this.tabId);
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  int _notifications;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token == '666') {
      print('token 存在，正在获取用户信息， 10S 后返回用户信息及未读消息。');
      fetchUserInfo();
    } else {
      print('token 不存在，不获取用户信息，请进入 My 页面登录。');
    }
  }

  // 获取用户信息
  fetchUserInfo() async {
    await Future.delayed(Duration(seconds: 10));
    print('用户信息返回');

    var formdata = {
      'userId': 1,
      'nickname': '13982271436',
      'desc': '前端开发工程师，热爱Flutter',
    };
    Provider.of<AccountModel>(context, listen: false).setUserinfo(formdata);

    // 设置未读消息
    setState(() {
      _notifications = 88;
    });
    // Timer(Duration(seconds: 10), () {
    //   print('用户信息返回');

    //   var formdata = {
    //     'userId': 1,
    //     'nickname': '13982271436',
    //     'desc': '前端开发工程师，热爱Flutter',
    //   };
    //   Provider.of<AccountModel>(context, listen: false).setUserinfo(formdata);

    //   // 设置未读消息
    //   setState(() {
    //     _notifications = 88;
    //   });
    // });
  }

  List<Widget> pages = <Widget>[
    Index(),
    MyCatalog(),
    Cart(),
    Mine(),
    // Mine1(),
  ];

  Widget _badge(int count) {
    return Container(
      height: 14,
      width: 14,
      decoration: new BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(
        minWidth: 14,
        minHeight: 14,
      ),
      child: Center(
        child: new Text(
          '$count',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _handleNavigator(int index) {
    // Navigator.pushNamed(context, '/mine');
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppArguments args = ModalRoute.of(context).settings.arguments;
    // print('args $args');
    if (args != null && args.tabId != null) {
      setState(() {
        _currentIndex = args.tabId;
      });
    }

    final String iconHome = 'assets/images/icon-home.svg';
    final String iconHomeActive = 'assets/images/icon-home-active.svg';

    Widget _icon(String iconName) {
      return SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset(iconName),
      );
    }

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: _icon(iconHome),
        activeIcon: _icon(iconHomeActive),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: 'Catalog',
      ),
      BottomNavigationBarItem(
        icon: _notifications == null
            ? Icon(Icons.shopping_cart_outlined)
            : Stack(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.shopping_cart_outlined),
                    height: 24,
                    width: 36,
                  ),
                  _badge(_notifications)
                ],
                alignment: Alignment.topRight,
                // overflow: Overflow.visible,
              ),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        activeIcon: Icon(Icons.account_box),
        label: 'My',
      ),
      // BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'My1'),
    ];

    return Scaffold(
      // body: pages[_currentIndex],
      // 点击菜单切换，有淡入动画，但是这种方式每次切换都会重新生成页面。
      // body: PageTransitionSwitcher(
      //   transitionBuilder: (
      //     Widget child,
      //     Animation animation,
      //     Animation secondaryAnimation,
      //   ) {
      //     return FadeThroughTransition(
      //       animation: animation,
      //       secondaryAnimation: secondaryAnimation,
      //       child: child,
      //     );
      //   },
      //   child: pages[_currentIndex],
      // ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        onTap: _handleNavigator,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        selectedFontSize: 12,
      ),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     // appBar: AppBar(
    //     //   title: Text('Home'),
    //     // ),
    //     body: viewContainer[_currentIndex],
    //     bottomNavigationBar: bottomNavigationBar,
    //   ),
    // );
  }
}
