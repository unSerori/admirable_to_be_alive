import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../items.dart';

// アカウント設定画面遷移先
class settingAccaunt extends StatefulWidget {
  const settingAccaunt({Key? key}) : super(key: key);

  @override
  _settingAccaunt createState() => _settingAccaunt();
}

class _settingAccaunt extends State<settingAccaunt> {
  @override
  Widget build(BuildContext context) {
    //画面サイズ
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
            child: Container(
      width: _screenSizeWidth,
      height: _screenSizeHeight,
      alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
      padding: EdgeInsets.all(_screenSizeWidth * 0.01),
      decoration: const BoxDecoration(
        color: Constant.sub1,
      ),
      child: Column(
        children: [
          Row(children: [
            SizedBox(width: _screenSizeWidth * 0.05),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Constant.white,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context); // 前のページに戻る
              },
            ),
            SizedBox(
              width: _screenSizeWidth * 0.2,
            ),
            Container(
              width: _screenSizeWidth * 0.3,
              height: _screenSizeHeight * 0.05,
              alignment: const Alignment(0.0, 0.5), //文字配置位置調整
              child: CustomText(text: 'アカウント', fontSize: _screenSizeWidth * 0.055, color: Constant.white),
            )
          ]),
          SizedBox(height: _screenSizeHeight * 0.05),

          //ここから入力フォーム
          Container(
              width: _screenSizeWidth * 0.8,
              height: _screenSizeHeight * 0.1,
              child: Column(children: [
                
                Row(children: [
                  SizedBox(
                    width: _screenSizeWidth * 0.05,
                  ),
                  Align(
                    alignment: Alignment.centerLeft, // テキストを左寄せに配置
                    child: CustomText(
                      text: 'なまえ：',
                      fontSize: _screenSizeWidth * 0.045,
                      color: Constant.white,
                    ),
                  ),
                ]),
                SizedBox(height: _screenSizeHeight * 0.01),
                Container(
                  width: _screenSizeWidth * 0.7,
                  height: _screenSizeHeight * 0.05,
                  alignment: const Alignment(0.0, 0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: items.userInfo['name'], // いまのなまえ
                    ),
                    onChanged: (text) {
                      items.userInfo['name'] = text;
                    },
                  ),
                )
              ]))
        ],
      ),
    )));
  }
}
