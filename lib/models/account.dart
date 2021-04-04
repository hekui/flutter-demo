import 'package:flutter/foundation.dart';

class AccountModel with ChangeNotifier {
  int userId;

  String nickname;

  String desc;
  // AccountModel(this.userId, this.nickname, this.desc);

  void clean() {
    userId = null;
    nickname = null;
    desc = null;
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

  void setUserinfo(data) {
    userId = data['userId'];
    nickname = data['nickname'];
    desc = data['desc'];
    notifyListeners();
  }

  // AccountModel.init()
  //     : userId = null,
  //       nickname = null;

  // AccountModel.fromJson(Map<String, dynamic> data)
  //     : userId = data['userId'],
  //       nickname = data['nickname'];
}
