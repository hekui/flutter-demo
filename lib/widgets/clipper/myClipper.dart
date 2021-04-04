import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// 二三阶贝塞尔曲线动画演示 https://zhuanlan.zhihu.com/p/299090889

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // 从 60，0 开始
    path.moveTo(60, 0); // P0
    // 二阶贝塞尔曲线画弧
    path.quadraticBezierTo(0, 0, 0, 60); // 4个参数分别是 P1 x, P1 y, P2 x, P2 y;
    // 以上的结果是左上角画了一个圆弧

    // 连接到底部
    path.lineTo(0, size.height / 1.2);
    // 三阶贝塞尔曲线画弧
    path.cubicTo(size.width / 4, size.height, size.width / 4 * 3,
        size.height / 1.5, size.width, size.height / 1.2);
    // 以上的结果是底部的弧形

    // 再连接回去
    path.lineTo(size.width, 60);
    // 再用二阶贝塞尔曲线画弧
    path.quadraticBezierTo(size.width - 60, 60, size.width - 60, 0);
    // 以上的结果是右上角的凹形
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Love extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // 以下数据是根据box为200*200设置。

    // 移动起始点。
    path.moveTo(size.width / 2, 60);

    // 二阶贝塞尔曲线
    path.quadraticBezierTo(10, -5, 0, 80);
    path.quadraticBezierTo(0, size.height - 50, size.width / 2, size.height);
    path.quadraticBezierTo(size.width, size.height - 50, size.width, 80);
    path.quadraticBezierTo(size.width - 10, -5, size.width / 2, 60);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double roundnessFactor = 20.0;
    Path path = Path();

    //移动到A点
    path.moveTo(0, size.height * 0.33);
    //画直线到B点 同时也充当 下一个二阶贝塞尔曲线 的起点
    path.lineTo(0, size.height - roundnessFactor);

    //二阶贝塞尔曲线 只有一个控制点
    // 控制点 C (0, size.height)
    // 终点 D (roundnessFactor, size.height)
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);

    //二阶贝塞尔曲线 只有一个控制点
    //画直线到 E点 同时也充当 二阶贝塞尔曲线 的起点
    path.lineTo(size.width - roundnessFactor, size.height);
    // 控制点 F (size.width, size.height)
    // 终点 G (size.width, size.height - roundnessFactor)
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);

    //二阶贝塞尔曲线 只有一个控制点
    //画直线到 H 点 同时也充当 二阶贝塞尔曲线 的起点
    path.lineTo(size.width, roundnessFactor * 2);
    // 控制点 M 与 终点 K
    path.quadraticBezierTo(size.width - 10, roundnessFactor,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);

    //二阶贝塞尔曲线 只有一个控制点
    //画直线到 T点 同时也充当 二阶贝塞尔曲线 的起点
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    //控制点 W Z
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
