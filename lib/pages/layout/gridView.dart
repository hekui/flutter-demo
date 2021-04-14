import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('GridView 混合布局'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: Colors.white,
              child: Center(
                child: Text(
                    'GridView 混合布局，外层使用 CustomScrollView \n这里使用的是 SliverGrid.count(), 而不是 GridView'),
              ),
            ),
          ),

          SliverGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(8, (index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }).toList(),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: EdgeInsets.only(bottom: 10, top: 10),
          //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          //     color: Colors.white,
          //     child: Center(
          //       child: Text('还可以嵌入一个ListView。 \n这里使用的是：SliverList()'),
          //     ),
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (content, index) {
          //       return Container(
          //         height: 85,
          //         alignment: Alignment.center,
          //         color: Colors.primaries[index % Colors.primaries.length],
          //         child: Text(
          //           '$index',
          //           style: TextStyle(color: Colors.white, fontSize: 20),
          //         ),
          //       );
          //     },
          //     childCount: 5,
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: Colors.white,
              child: Center(
                child: Text(
                    '给一些装饰，注意添加属性：\nphysics: ScrollPhysics()\n否则，在 GridView 区域无法滚动。'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Some title'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('这里使用的 GridView.builder(), 而不是 SliverGrid'),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        alignment: Alignment.center,
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        child: Text(
                          '$index',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      );
                    },
                    itemCount: 15,
                    physics: ScrollPhysics(),
                  )
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
