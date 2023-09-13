import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../items.dart';

//ヘルプ
class PageHelp extends StatefulWidget {
  const PageHelp({Key? key}) : super(key: key);

  @override
  _PageHelp createState() => _PageHelp();
}

class _PageHelp extends State<PageHelp> {
  @override
  Widget build(BuildContext context) {
    //画面サイズ
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(body: Center(child: Container(
      width: _screenSizeWidth,
      height: _screenSizeHeight,
      alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
      padding: EdgeInsets.all(_screenSizeWidth * 0.01),
      decoration: const BoxDecoration(
        color: Constant.sub2,
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
              width: _screenSizeWidth * 0.15,
            ),
            Container(
              width: _screenSizeWidth * 0.375,
              height: _screenSizeHeight * 0.05,
              alignment: const Alignment(0.0, 0.5), //文字配置位置調整
              child: CustomText(text: 'ヘルプ', fontSize: _screenSizeWidth * 0.055, color: Constant.white),
            )
          ]),
          SizedBox(height: _screenSizeHeight * 0.025),

          //ここから入力フォーム
        ],
      ),
    )));
  }
}
