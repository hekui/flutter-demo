import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:shop/pages/app.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final _controller = PageController();
  List<Widget> _pages;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  double screenHeight;

  @override
  Widget build(BuildContext context) {
    this.screenHeight = MediaQuery.of(context).size.height;
    _buildPages();

    return Stack(
      children: <Widget>[
        //pageViw
        PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index];
          },
          //条目个数
          itemCount: _pages.length,
        ),
        //圆点指示器
        Positioned(
          bottom: screenHeight * 0.08,
          left: 0.0,
          right: 0.0,
          child: Container(
            child: Center(
              child: DotsIndicator(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  void _buildPages() {
    this._pages = <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          imageUrl: "https://picsum.photos/750/1433?1",
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: CachedNetworkImage(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          imageUrl: "https://picsum.photos/750/1433?2",
          placeholder: (context, url) => Center(
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            //Stack即层叠布局控件，能够将子控件层叠排列
            //alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子widget。所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                imageUrl: "https://picsum.photos/750/1433?3",
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 24,
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 120,
                  height: 40,
                  margin: EdgeInsets.only(
                    bottom: this.screenHeight * 0.08 + 60,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(context, '/');
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          // transitionDuration: Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) => App(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var curve = Curves.ease;
                            var tween = Tween<double>(begin: 0, end: 1)
                                .chain(CurveTween(curve: curve))
                                .animate(animation);
                            return FadeTransition(
                              opacity: tween,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Text("立即体验"),
                  ),
                ),
              ),
            ],
          )),
    ];
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }
}
