import 'dart:ui';

import 'package:admirable_to_be_alive_/view/components/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'items.dart';
import 'package:http/http.dart' as http;  // http
import 'dart:convert';  // json



class Constant {
  static const Color main = Color(0xFF82E2E4);
  static const Color sub1 = Color(0xFFFF9F9F);
  static const Color sub2 = Color.fromARGB(255, 197, 233, 53);
  static const Color sub3 = Color(0xFFFFDC61);
  static const Color glay = Color(0xFFD9D9D9);
  static const Color blackGlay = Color.fromARGB(255, 124, 124, 124);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF3E3E3E);
  static const Color red = Color.fromARGB(255, 204, 24, 24);
}

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      softWrap: true, // 自動改行
      overflow: TextOverflow.ellipsis, // テキストが領域からはみ出た場合の動作を指定
      maxLines: 2, // 改行後の最大行数
      style: GoogleFonts.kosugiMaru(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class iconPictures extends StatefulWidget {
  int picture;
  
  iconPictures({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  _iconsPictures createState() => _iconsPictures();
}

class _iconsPictures extends State<iconPictures> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: InkWell(
            onTap: () {
              items.iconNumber = widget.picture;
              Navigator.pop(context);

              setState(() {});
            },
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Constant.glay,
              backgroundImage: AssetImage(items.icons[widget.picture]),
            )));
  }
}

//枠線付きボックス
class MainBox {
  static Widget MainBox2(Widget widget, double scleenwidth, double scleenheight, double width, double height,
      {Color bordColor = Constant.main, Color boederColor = Constant.white, double borderWidth = 2}) {
    //外側の箱
    return Container(
        width: scleenwidth * width,
        height: scleenheight * height,
        alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
        decoration: BoxDecoration(
          color: bordColor,
          borderRadius: BorderRadius.circular(10), //角丸
        ),
        //中身の箱
        child: Container(
            alignment: const Alignment(0.0, 0.0),
            width: scleenwidth * (width - 0.05),
            height: scleenheight * (height - 0.025),
            decoration: BoxDecoration(
              color: bordColor,
              borderRadius: BorderRadius.circular(10), //角丸
              border: Border.all(
                color: boederColor,
                width: borderWidth,
              ),
            ),
            child: widget));
  }
}

//スタンプ用ボックス
class stampBox {
  static Widget stampBox2(
    double scleenwidth,
    bool stampBoxBoll,
  ) {
    Widget myWidget;
    if (stampBoxBoll) {
      myWidget = Image.asset(items.Pictures[6]);
    } else {
      myWidget = Opacity(opacity: 0, child: Image.asset(items.Pictures[6]));
    }

    //枠
    return Container(
      width: scleenwidth * 0.15,
      height: scleenwidth * 0.15,
      margin: EdgeInsets.all(scleenwidth * 0.015),
      alignment: const Alignment(0.0, 0.0), //配置を真ん中にする
      decoration: BoxDecoration(
        color: Constant.white,
        borderRadius: BorderRadius.circular(1), //角丸
      ),
      //スタンプ
      child: myWidget,
    );
  }
}


class dailyInfo extends StatefulWidget {
  int picture;
  
  dailyInfo({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  _dailyInfo createState() => _dailyInfo();
}

class _dailyInfo extends State<dailyInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: InkWell(
            onTap: () {
              items.iconNumber = widget.picture;
              Navigator.pop(context);

              setState(() {});
            },
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Constant.glay,
              backgroundImage: AssetImage(items.icons[widget.picture]),
            )));
  }
}



/*

//背景
class HorizontalScrollingBackground extends StatefulWidget {
  @override
  _HorizontalScrollingBackgroundState createState() => _HorizontalScrollingBackgroundState();
}

class _HorizontalScrollingBackgroundState extends State<HorizontalScrollingBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();

    // アニメーションコントローラーを初期化
    _controller = AnimationController(
      duration: Duration(seconds: 15), // アニメーションの期間
      vsync: this,
    )..repeat(); // アニメーションを繰り返す

    // Tweenを使ってアニメーションの開始値と終了値を設定
    Tween<Offset> _tween = Tween<Offset>(
      begin: Offset(0, 0), // 開始位置
      end: Offset(1, -1), // 終了位置 (斜め上方向に移動)
    );

    // アニメーションを設定
    _animation = _tween.animate(_controller)
      ..addListener(() {
        setState(() {}); // ウィジェットを再描画
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // アニメーションコントローラーを破棄
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 画面サイズを取得
    screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight,
      color: Colors.white.withOpacity(0), // 背景色
      child: Stack(
        children: [
          // 背景画像
          AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                left: _animation.value.dx * screenWidth, // 水平方向の位置
                top: _animation.value.dy * screenHeight, // 垂直方向の位置
                child: Image.asset(
                  'images/haikei.png', // 画像のパスを指定
                  width: screenWidth, // 画面幅に合わせて画像を表示
                  height: screenHeight,
                  fit: BoxFit.cover, // 画像を画面に合わせて表示
                ),
              );
            },
          ),
          // その他のウィジェットをここに追加
        ],
      ),
    );
  }
}
*/

// Httpリクエストを投げるクラス
// 
class HttpToServer {  // HttpLib
  // インスタンス変数
  // URLとかポートとかプロトコルとか
  static const String serverIP = "127.0.0.1";  // "127.0.0.1""10.200.0.82""tidalhip.local""10.200.0.115"10.25.10.10710.200.0.163
  static const String server_port = "5000";
  static const String protocol = "http";
  static baseUrl() {  // 鯖のURLを設定
    return protocol + "://" + serverIP + ":" + server_port;
  }

  // コンストラクタってなに？？
  HttpToServer();

  // "URLパラメータ", "HTTPメソッド", "body"  例えば (/send_userInfo", "POST", items.userInfo)
  // HTTP リクエストを送信する関数 
  static Future<List> httpReq(String path_para, String method, Map<String, dynamic> body) async {

    
    //header
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
    };
    // "Access-Control-Allow-Origin": "*"

    // リクエスト作成
    var req = http.Request("POST", Uri.parse(baseUrl() + path_para));  // HTTPリクエストメソッドの種類とuriから
      // debugPrint(req.toString());
    req.headers.addAll(headersList);  // header情報を追加
      // debugPrint(req.toString());
    req.body = json.encode(body);  // bodyをjson形式に変換
      // debugPrint(req.toString());

    try {

      // HTTPリクエストを送信。 seconds: 5 で指定した秒数応答がなかったらタイムアウトで例外を発生させる
      var res = await req.send();//.timeout(const Duration(seconds: 5));
      debugPrint(res.toString());
      // レスポンスをストリームから文字列に変換して保存
      final resBody = await res.stream.bytesToString();

      // ステータスコードが正常ならtrueと内容を返す
      if (res.statusCode >= 200 && res.statusCode < 300) {
        debugPrint([true, resBody].toString());
        return [true, resBody];
      } else {
        debugPrint([false, res.statusCode.toString(), resBody].toString());
        return [false, res.statusCode.toString(), resBody];
      }

    } catch (e) {  // タイムアウトしたとき。

      debugPrint("exception error: " + e.toString());
      debugPrint([false, "おうとうないよ；；"].toString());
      return [false, "おうとうないよ；；"];

    }


    // if (response.statusCode == 200) {
    //   // レスポンスが成功した場合
    //   final data = json.decode(response.body);
      
    // } else {
    //   // レスポンスがエラーの場合
     
    // }
  }
}