import 'package:flutter/material.dart';
import 'package:shop/pages/layout/border.dart';
import 'package:shop/pages/layout/gridView.dart';
import '../pages/app.dart';
import '../pages/detail.dart';
import '../pages/fullscreen.dart';
import '../pages/sliverAppBar.dart';
import '../pages/sliverAppBar1.dart';
import '../pages/sliverAppBar2.dart';
import '../pages/sliverHeader.dart';
import '../pages/textField.dart';
import '../pages/404.dart';
import '../pages/staggered.dart';
import '../pages/staggeredDemo.dart';
import '../pages/drawer.dart';
import '../pages/appBar.dart';
import '../pages/search.dart';
import '../pages/clip.dart';
import '../pages/animations.dart';
import '../pages/indexLayout.dart';

class Routers {
  static String root = '/';
  static String detail = '/detail';
  static String fullscreen = '/fullscreen';
  static String sliverAppBar = '/sliverAppBar';
  static String sliverAppBar1 = '/sliverAppBar1';
  static String sliverAppBar2 = '/sliverAppBar2';
  static String sliverHeader = '/sliverHeader';
  static String textField = '/textField';
  static String staggered = '/staggered';
  static String staggeredDemo = '/staggeredDemo';
  static String drawer = '/drawer';
  static String appbar = '/appbar';
  static String search = '/search';
  static String clip = '/clip';
  static String animations = '/animations';
  static String indexLayout = '/indexLayout';
  static String gridViewLayout = '/gridViewLayout';
  static String borderLayout = '/borderLayout';

  // define routes
  static final routes = {
    root: (context) => App(),
    detail: (context) => Detail(),
    fullscreen: (context) => Fullscreen(),
    sliverAppBar: (context) => SliverAppBarDemo(),
    sliverAppBar1: (context) => SliverAppBarDemo1(),
    sliverAppBar2: (context) => SliverAppBarDemo2(),
    sliverHeader: (context) => SliverHeader(),
    textField: (context) => TextFieldDemo(),
    staggered: (context) => Staggered(),
    staggeredDemo: (context) => StaggeredDemo(),
    drawer: (context) => DrawerDemo(),
    appbar: (context) => AppBarDemo(),
    search: (context) => SearchPage(),
    clip: (context) => Clip(),
    animations: (context) => AnimationsDemo(),
    indexLayout: (context) => IndexLayout(),
    gridViewLayout: (context) => GridViewPage(),
    borderLayout: (context) => BorderPage(),
  };

  // common settings
  static onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    print('Route -> name $name');
    // return MaterialPageRoute(builder: (context) => NotFound());
    // final Function pageContentBuilder = routes[name];

    // if (pageContentBuilder != null) {
    //   if (settings.arguments != null) {
    //     final Route route = MaterialPageRoute(
    //         builder: (context) =>
    //             pageContentBuilder(context, arguments: settings.arguments));
    //     return route;
    //   } else {
    //     final Route route = MaterialPageRoute(
    //         builder: (context) => pageContentBuilder(context));
    //     return route;
    //   }
    // }
  }

  static onUnknownRoute(RouteSettings settings) {
    print('onUnknownRoute: $settings');
    return MaterialPageRoute(builder: (context) {
      return NotFound();
    });
  }
}
