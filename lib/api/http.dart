import 'package:http/http.dart' as http;
import 'dart:convert';

String getDomain() {
  const String _prodApiDomain = 'https://api.aogohome.app';
  return _prodApiDomain;
}

// 暂时只提供出 get post 方法。
class Api {
  Future<dynamic> get(String url) async {
    String authToken = '666';
    Uri uri = Uri.parse(getDomain() + url);
    var response = await http.get(
      uri,
      headers: {"Authorization": 'Bearer $authToken'},
    );

    if (response.statusCode == 200) {
      print('[get]请求成功 - url $uri -');
      var responseBody = jsonDecode(response.body);
      print('responseBody = $responseBody');
      return responseBody ??= true;
    } else {
      print('[get]请求失败 - url $uri -');
      return null;
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> payload) async {
    String authToken = '666';
    Uri uri = Uri.parse(url);
    String bodyPayload = payload == null ? '' : json.encode(payload);
    var response = await http.post(
      uri,
      body: utf8.encode(
        bodyPayload,
      ),
      headers: {
        "Content-type": "application/json",
        "Authorization": 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      print('[post]请求成功 - url $uri - payload - $bodyPayload -');
      var responseBody = jsonDecode(response.body);
      print('responseBody = $responseBody');
      return responseBody ??= true;
    } else {
      print('[post]请求失败 - url $uri - payload - $bodyPayload -');
      return null;
    }
  }
}
