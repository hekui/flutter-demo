import 'dart:ui';

import 'package:flutter/material.dart';

class BorderPage extends StatefulWidget {
  @override
  _BorderPageState createState() => _BorderPageState();
}

class _BorderPageState extends State<BorderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: Colors.white,
              child: Center(
                child: Text('基本 Border 设置'),
              ),
            ),
          ),
          // 基本形状
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  // 形状 BoxDecoration
                  Container(
                    child: Text('BoxDecoration'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2,
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  // ShapeDecoration
                  Container(
                    child: Text('ShapeDecoration'),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: StadiumBorder(
                              side: BorderSide(
                                width: 2,
                                color: Colors.blue,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'ShapeDecoration',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: StadiumBorder(
                              side: BorderSide(
                                width: 2,
                                color: Colors.blue,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'StadiumBorder（体育场形状）',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                width: 2,
                                color: Colors.blue,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'RoundedRectangleBorder',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                  // 渐变
                  Container(
                    child: Text('渐变'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.yellow, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        // 圆形渐变，从中心开始渐变
                        colors: [Colors.yellow, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: SweepGradient(
                        // 圆形渐变，从中心开始渐变
                        colors: [Colors.yellow, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: Colors.white,
              child: Center(
                child: Text('Button 设置'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: MaterialButton(
                              onPressed: () {}, child: Text('MaterialButton'))),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextButton(
                              onPressed: () {}, child: Text('TextButton'))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () {}, child: Text('OutlinedButton'))),
                      SizedBox(width: 10),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('ElevatedButton'))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('MaterialButton1'),
                          shape: StadiumBorder(
                            side: BorderSide(
                              width: 2,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('MaterialButton2'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              width: 2,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '通过父容器控制宽高',
                            style: TextStyle(fontSize: 8, color: Colors.blue),
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '通过父容器控制宽高(取消了默认填充)',
                            style: TextStyle(fontSize: 8, color: Colors.blue),
                          ),
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              width: 1,
                              color: Colors.blue,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          '自定义高度，宽度自适应',
                          style: TextStyle(fontSize: 8, color: Colors.blue),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        minWidth: 0,
                        height: 30,
                        splashColor: Colors.blue.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            width: 1,
                            color: Colors.blue,
                            style: BorderStyle.solid,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          '自定义点击颜色',
                          style: TextStyle(fontSize: 8, color: Colors.blue),
                        ),
                        highlightColor:
                            Colors.blue.withOpacity(0.2), // 点击后的背景颜色
                        splashColor: Colors.blue.withOpacity(0.2), // 波纹颜色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            width: 1,
                            color: Colors.blue,
                            style: BorderStyle.solid,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
