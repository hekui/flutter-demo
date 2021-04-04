import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/catalog.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/account.dart';
// import 'package:shop/pages/cart.dart';
import 'package:shop/router/routers.dart';

// void main() => runApp(MyApp());

void main() {
  runApp(
    MultiProvider(
      // create: (context) => CartModel(),
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(create: (context) => AccountModel()),
      ],
      child: MyApp(),
    ),
  );

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate
      // ],
      // supportedLocales: [
      //   const Locale('en', 'US'),
      //   const Locale('zh', 'CH'),
      // ],
      // localeListResolutionCallback:
      //     (List<Locale> locales, Iterable<Locale> supportedLocales) {
      //   if (locales.contains('zh')) {
      //     return Locale('zh');
      //   }
      //   return Locale('en');
      // },
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
        // accentColor: Colors.teal,
        // primaryColor: Colors.teal,
        buttonColor: Colors.black38,
        // splashColor: Colors.yellow,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          splashColor: Colors.yellow,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              // backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
        ),
        textTheme: TextTheme(
          button: TextStyle(color: Colors.red, fontSize: 14),
          bodyText1: TextStyle(
            height: 1,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.green,
        ),
      ),
      initialRoute: Routers.root,
      routes: Routers.routes,
      onGenerateRoute: (RouteSettings settings) =>
          Routers.onGenerateRoute(settings),
      onUnknownRoute: (RouteSettings settings) =>
          Routers.onUnknownRoute(settings),
    );
  }
}
