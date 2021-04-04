import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop/models/account.dart';
import 'package:shop/pages/textField.dart';

class FormData {
  String account = '';
  String password = '';
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormData form = FormData();
  FocusNode _account, _password;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _account = FocusNode();
    _password = FocusNode();
  }

  @override
  void dispose() {
    _account.dispose();
    _password.dispose();
    super.dispose();
  }

  String _validateAccount(String value) {
    final phoneExp = RegExp(r'^1\d{10}$');
    if (!phoneExp.hasMatch(value)) {
      return '账号不正确';
    }
    return null;
  }

  String _validatePassword(String value) {
    // if (value.isEmpty) {
    //   return '请输入密码';
    // } else if (value.length < 6 || value.length > 8) {
    //   return '密码为6-8位';
    // }
    return null;
  }

  void showSnakBar(text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleSubmitted(context) async {
    final _form = _formKey.currentState;
    if (!_form.validate()) {
      _autovalidateMode = AutovalidateMode.always;
      showSnakBar('请先修正红色错误，再提交。');
    } else {
      _form.save();

      // 存储token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', '666');

      print('validated account: ${form.account} | password: ${form.password}');

      var formdata = {
        'userId': 1,
        'nickname': form.account,
        'desc': '前端开发工程师，热爱Flutter',
      };

      Provider.of<AccountModel>(context, listen: false).setUserinfo(formdata);
      // 用于无状态组件。
      // context.read<AccountModel>().setUserinfo(formdata);

      showSnakBar('已登录');
    }
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxSpace,
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  // icon: const Icon(Icons.person),
                  labelText: '账号(手机号码)',
                ),
                keyboardType: TextInputType.phone,
                validator: _validateAccount,
                onSaved: (value) {
                  form.account = value;
                  _password.requestFocus();
                },
                initialValue: '13982271436',
              ),
              sizedBoxSpace,
              PasswordField(
                textInputAction: TextInputAction.next,
                labelText: '密码',
                helperText: '请勿超过 8 个字符。',
                validator: _validatePassword,
                onSaved: (value) {
                  form.password = value;
                },
                onFieldSubmitted: (value) {
                  _handleSubmitted(context);
                },
              ),
              sizedBoxSpace,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '登陆即视为同意',
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextSpan(
                        text: '《蛋定宝用户服务协议》',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('点击了用户协议');
                            showSnakBar('点击了用户协议');
                          })
                  ],
                ),
              ),
              sizedBoxSpace,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _handleSubmitted(context);
                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     context.read<AccountModel>().clean();
              //   },
              //   child: Text('Logout'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
