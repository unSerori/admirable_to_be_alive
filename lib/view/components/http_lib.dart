import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  // json
// import 'package:jwt_decode/jwt_decode.dart';  //


class HttpToServer {
  // インスタンス変数
  // URLとかポートとかプロトコルとか
  static const String serverIP = "127.0.0.1";  // "127.0.0.1""10.200.0.82""tidalhip.local""10.200.0.115"10.25.10.10710.200.0.163
  static const String server_port = "5000";
  static const String protocol = "http";
  static baseUrl() {  // 鯖のURLを設定
    return protocol + "://" + serverIP + ":" + server_port;
  }

  // コンストラクタってなに？
  HttpToServer();

  // GET


  // HTTP POSTリクエストを送信する関数
  Future<void> fetchData() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
    };

    var body = {
      "": ""
    };

    final response = await http.post(Uri.parse(baseUrl()) + "/send_userInfo", body);

    if (response.statusCode == 200) {
      // レスポンスが成功した場合
      final data = json.decode(response.body);
      
    } else {
      // レスポンスがエラーの場合
     
    }
  }
}