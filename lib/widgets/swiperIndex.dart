import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import './../pages/detail.dart';

// import './../router/routers.dart';

class SwiperIndex extends StatelessWidget {
  final List dataList;
  SwiperIndex({Key key, this.dataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(
              //   Routers.detail,
              //   arguments: dataList[index]['goodsId'],
              // );
              // Navigator.pushNamed(context, '/detail', arguments: {
              //   'id': dataList[index]['goodsId'],
              // });
              // can work
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Detail()));
            },
            child: Image.network('${dataList[index]['img']}', fit: BoxFit.fill),
          );
        },
        itemCount: dataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
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
}
