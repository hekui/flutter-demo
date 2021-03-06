import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo();

  @override
  Widget build(BuildContext context) {
    // on the framework.
    return Scaffold(
      appBar: AppBar(
        title: Text('文本字段'),
      ),
      body: const TextFormFieldDemo(),
    );
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? '显示密码' : '隐藏密码',
          ),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  PersonData person = PersonData();

  FocusNode _phoneNumber, _email, _lifeStory, _password, _retypePassword;

  @override
  void initState() {
    // print('person ${person.name}');
    super.initState();
    _phoneNumber = FocusNode();
    _email = FocusNode();
    _lifeStory = FocusNode();
    _password = FocusNode();
    _retypePassword = FocusNode();
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    _email.dispose();
    _lifeStory.dispose();
    _password.dispose();
    _retypePassword.dispose();
    super.dispose();
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidateMode =
          AutovalidateMode.always; // Start validating on every change.
      showInSnackBar(
        "请先修正红色错误，然后再提交。",
      );
    } else {
      form.save();
      showInSnackBar("${person.name}的手机号码是 ${person.phoneNumber}");
    }
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return "必须填写姓名。";
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return "请只输入字母字符。";
    }
    return null;
  }

  String _validatePhoneNumber(String value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)) {
      return "(###) ###-#### - 请输入美国手机号码。";
    }
    return null;
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return "请输入密码。";
    }
    if (passwordField.value != value) {
      return "密码不一致";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);

    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            sizedBoxSpace,
            TextFormField(
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.person),
                hintText: "人们如何称呼您？",
                labelText: "姓名*",
              ),
              onSaved: (value) {
                person.name = value;
                _phoneNumber.requestFocus();
              },
              validator: _validateName,
              // autofocus: true,
            ),
            sizedBoxSpace,
            TextFormField(
              textInputAction: TextInputAction.next,
              focusNode: _phoneNumber,
              decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.phone),
                hintText: "我们如何与您联系？",
                labelText: "手机号码*",
                prefixText: '+1 ',
              ),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                person.phoneNumber = value;
                _email.requestFocus();
              },
              maxLength: 14,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              validator: _validatePhoneNumber,
              // TextInputFormatters are applied in sequence.
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                // Fit the validating format.
                _phoneNumberFormatter,
              ],
            ),
            sizedBoxSpace,
            TextFormField(
              textInputAction: TextInputAction.next,
              focusNode: _email,
              decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.email),
                hintText: "您的电子邮件地址",
                labelText: "电子邮件",
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                person.email = value;
                _lifeStory.requestFocus();
              },
            ),
            sizedBoxSpace,
            TextFormField(
              focusNode: _lifeStory,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "请介绍一下您自己（例如，写出您的职业或爱好）",
                helperText: "请确保内容简洁，因为这只是一个演示。",
                labelText: "生平事迹",
              ),
              maxLines: 3,
            ),
            sizedBoxSpace,
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "工资",
                suffixText: "美元",
              ),
              maxLines: 1,
            ),
            sizedBoxSpace,
            PasswordField(
              textInputAction: TextInputAction.next,
              focusNode: _password,
              fieldKey: _passwordFieldKey,
              helperText: "请勿超过 8 个字符。",
              labelText: "密码*",
              onFieldSubmitted: (value) {
                setState(() {
                  person.password = value;
                  _retypePassword.requestFocus();
                });
              },
            ),
            sizedBoxSpace,
            TextFormField(
              focusNode: _retypePassword,
              decoration: InputDecoration(
                filled: true,
                labelText: "再次输入密码*",
              ),
              maxLength: 8,
              obscureText: true,
              validator: _validatePassword,
              onFieldSubmitted: (value) {
                _handleSubmitted();
              },
            ),
            sizedBoxSpace,
            Center(
              child: ElevatedButton(
                child: Text("提交"),
                onPressed: _handleSubmitted,
              ),
            ),
            sizedBoxSpace,
            Text(
              "* 表示必填字段",
              style: Theme.of(context).textTheme.caption,
            ),
            sizedBoxSpace,
          ],
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##
class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
