import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final double topbarHeight = MediaQueryData.fromWindow(window).padding.top;

  TextEditingController _search = TextEditingController();
  String _searchKey = '';

  var searchHistoryList = [
    '打发打发阿斯顿发生撒旦法发as阿斯蒂芬',
    '白壳红心',
    '黄壳红心',
    '鸭蛋',
    '鹌鹑蛋',
    '土鸡蛋',
    '撒旦法阿凡达阿萨德的',
    '玉米蛋'
  ];
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  void onSearchTextChanged(value) {
    this.setState(() {
      _search.text = value;
    });
  }

  void onSubmitSearch(value) {
    print('submitting $value');
    setState(() {
      _searchKey = value;
      if (_searchKey.isNotEmpty) {
        print('fetching');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: _searchKey.isEmpty ? _searchHistory() : _searchResult(),
    );
  }

  Widget _customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xD93A5BAA), Color(0xD617B1E5)]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: topbarHeight,
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    color: Colors.white,
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'searchRow',
                      child: Card(
                        child: Container(
                          height: 36,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Expanded(
                                child: Container(
                                  // height: 20,
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: _search,
                                    maxLines: 1,
                                    maxLength: 20,
                                    // autofocus: true,
                                    // maxLength: TextField.noMaxLength,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 14,
                                    ),
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    // autofocus: true,
                                    decoration: new InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        height: 2,
                                      ),
                                      // fillColor: Colors.black26,
                                      // filled: true,
                                      // contentPadding: EdgeInsets.all(0),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),

                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      counterText: "",
                                    ),
                                    textInputAction: TextInputAction.search,
                                    onChanged: onSearchTextChanged,
                                    onSubmitted: onSubmitSearch,
                                  ),
                                ),
                              ),
                              _search.text.isNotEmpty
                                  ? new IconButton(
                                      icon: new Icon(Icons.cancel),
                                      color: Colors.grey,
                                      iconSize: 18.0,
                                      onPressed: () {
                                        setState(() {
                                          _search.clear();
                                          _searchKey = '';
                                        });
                                        // onSearchTextChanged(null);
                                      },
                                    )
                                  : Container(),
                              // Builder(
                              //   builder: (context) {
                              //     return new IconButton(
                              //       icon: new Icon(Icons.cancel),
                              //       color: Colors.grey,
                              //       iconSize: 18.0,
                              //       onPressed: () {
                              //         controller.clear();
                              //         // onSearchTextChanged('');
                              //       },
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchHistory() {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                // color: Colors.red,
                // height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '搜索历史',
                      style: TextStyle(fontSize: 16),
                    ),
                    _isEditing
                        ? Container(
                            height: 12,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Text(
                                    '全部删除',
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      searchHistoryList.clear();
                                      _isEditing = false;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                SizedBox(
                                  width: 1,
                                  height: 10,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                InkWell(
                                  child: Text(
                                    '完成',
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 12,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _isEditing = false;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete_forever_rounded,
                              size: 20,
                              color: Colors.grey,
                            ),
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(
                              minWidth: 20,
                              maxWidth: 20,
                              minHeight: 20,
                              maxHeight: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _isEditing = true;
                              });
                            },
                          )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(searchHistoryList.length, (index) {
                  return Ink(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        // gradient: LinearGradient(
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        //   colors: [Color(0xFFDE2F21), Color(0xFFEC592F)],
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        // color: Colors.grey[300],
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              '${searchHistoryList[index]}',
                              style: TextStyle(
                                height: 1,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            _isEditing
                                ? Container(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.close,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                  )
                                : SizedBox(width: 0)
                          ],
                        ),
                      ),
                      onTap: () {
                        if (_isEditing) {
                          setState(() {
                            searchHistoryList.removeAt(index);
                          });
                        } else {
                          var value = searchHistoryList[index];
                          setState(() {
                            _search.text = value;
                          });
                          onSubmitSearch(value);
                        }
                      },
                    ),
                  );
                  // return OutlinedButton(
                  //   style: ButtonStyle(
                  //       // textStyle: MaterialStateProperty.all(Colors.black),
                  //       backgroundColor:
                  //           MaterialStateProperty.all(Colors.white)),
                  //   onPressed: () {},
                  //   child: Text('${searchHistoryList[index]}'),
                  // );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  '搜索发现',
                  style: TextStyle(fontSize: 16, height: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(8, (index) {
                  return OutlinedButton(
                      style: ButtonStyle(
                          // textStyle: MaterialStateProperty.all(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Text('$index'));
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchResult() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text('search result'),
      ),
    );
  }
}
