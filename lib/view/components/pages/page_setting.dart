import 'package:flutter/material.dart';
import '../constant.dart';
import '../items.dart';
import 'setting/page_accaunt.dart';
import 'setting/page_help.dart';
import 'setting/page_setting_daily.dart';

class PageSetting extends StatefulWidget {
  const PageSetting({Key? key}) : super(key: key);

  @override
  _PageSetting createState() => _PageSetting();
}

class _PageSetting extends State<PageSetting> {
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
        padding: EdgeInsets.all(_screenSizeWidth * 0.01),
        decoration: const BoxDecoration(color: Constant.white),
        alignment: Alignment(0.0, 0.0),
        child: Column(
          children: [
            SizedBox(height: _screenSizeHeight * 0.02),
            Row(children: [
              SizedBox(width: _screenSizeWidth * 0.05),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Constant.glay,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context); // 前のページに戻る
                },
              ),
              SizedBox(
                width: _screenSizeWidth * 0.28,
              ),
              CustomText(text: '設定', fontSize: _screenSizeWidth * 0.055, color: Constant.blackGlay),
            ]),
            SizedBox(height: _screenSizeHeight * 0.025),

            //アカウント設定
            InkWell(
              onTap: () {
                //ページ遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingAccaunt()),
                ).then((value) {
                  //戻ってきたら再描画
                  setState(() {});
                });
              },
              child: MainBox.MainBox2(
                  CustomText(
                    text: 'アカウント',
                    fontSize: _screenSizeWidth * 0.04,
                    color: Constant.white,
                  ),
                  bordColor: Constant.sub1,
                  _screenSizeWidth,
                  _screenSizeHeight,
                  0.9,
                  0.1),
            ),
            SizedBox(height: _screenSizeHeight * 0.02),

            //デイリーミッション設定
            InkWell(
              onTap: () {
                //ページ遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingDaily()),
                ).then((value) {
                  //戻ってきたら再描画
                  setState(() {});
                });
              },
              child: MainBox.MainBox2(
                  CustomText(
                    text: 'デイリーミッション',
                    fontSize: _screenSizeWidth * 0.04,
                    color: Constant.white,
                  ),
                  bordColor: Constant.sub3,
                  _screenSizeWidth,
                  _screenSizeHeight,
                  0.9,
                  0.1),
            ),
            SizedBox(height: _screenSizeHeight * 0.02),

            //ヘルプ
            InkWell(
              onTap: () {
                //ページ遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageHelp()),
                ).then((value) {
                  //戻ってきたら再描画
                  setState(() {});
                });
              },
              child: MainBox.MainBox2(
                  CustomText(
                    text: 'ヘルプ',
                    fontSize: _screenSizeWidth * 0.04,
                    color: Constant.white,
                  ),
                  bordColor: Constant.sub2,
                  _screenSizeWidth,
                  _screenSizeHeight,
                  0.9,
                  0.1),
            ),

            SizedBox(
              height: _screenSizeHeight * 0.13,
            ),

            //画像
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _screenSizeWidth * 0.7,
                child: Image.asset(
                  items.Pictures[5],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
