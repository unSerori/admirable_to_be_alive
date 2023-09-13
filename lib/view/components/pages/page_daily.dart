import 'dart:js_util';

import 'package:admirable_to_be_alive_/main.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../items.dart';

class PageDaily extends StatefulWidget {
  const PageDaily({Key? key}) : super(key: key);

  @override
  PageDailyState createState() => PageDailyState();
}

class PageDailyState extends State<PageDaily> {
  //ミッション達成率
  static double Achievement = 0;
  @override
  Widget build(BuildContext context) {
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(children: [
      Center(
          child: Container(
        width: _screenSizeWidth,
        height: _screenSizeHeight,
        color: Constant.sub3,
        child: Stack(children: [
          //HorizontalScrollingBackground(),  //背景スクロール
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(children: [
              Row(children: [
                SizedBox(width: _screenSizeWidth * 0.05),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Constant.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // 前のページに戻る
                  },
                ),
              ]),
              Expanded(
                child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // すべての要素を右寄せ
                        children: [
                          //個別に右寄せする必要あり
                          //見出し
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomText(
                                text: 'デイリーミッション', fontSize: _screenSizeWidth * 0.055, color: Constant.white),
                          ),
                          //達成率
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomText(
                                text: '${Achievement.toInt()} %',
                                fontSize: _screenSizeWidth * 0.055,
                                color: Constant.white),
                          )
                        ])),
              ),
              SizedBox(
                width: _screenSizeWidth * 0.05,
              )
            ]),

            SizedBox(height: _screenSizeHeight * 0.01),

            //ミッションリスト
            Container(
                height: _screenSizeHeight * 0.85,
                child: ListView(
                    //   children: items.todayLists['id'].entries.map<Widget>((entry) {
                    // int index = entry.key;
                    // var item = entry.value;
                    children: (items.todayLists['id'] as List<Map<String, dynamic>>?)?.map<Widget>((item) {
                          //['id']の中の要素数の取得
                          int index =
                              (items.todayLists['id'] as List<Map<String, dynamic>>?)?.indexOf(item) ?? -1; //null除外

                          //ここから表示部分
                          return ListTile(
                            title: Container(
                              margin: EdgeInsets.all(_screenSizeWidth * 0.025),
                              padding: EdgeInsets.all(_screenSizeWidth * 0.025),
                              decoration: BoxDecoration(
                                color: item['bool'] ? Constant.glay : Constant.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: _screenSizeWidth * 0.03,
                                  ),
                                  //画像表示
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Constant.glay,
                                    backgroundImage: AssetImage(items.Pictures[3]),
                                  ),
                                  SizedBox(
                                    width: _screenSizeWidth * 0.02,
                                  ),

                                  // ミッション内容
                                  Container(
                                    width: _screenSizeWidth * 0.32,
                                    margin: EdgeInsets.all(_screenSizeWidth * 0.01),
                                    child: CustomText(
                                      color: Constant.black,
                                      text: item['things'],
                                      fontSize: _screenSizeHeight * 0.02,
                                    ),
                                  ),

                                  SizedBox(
                                    width: _screenSizeWidth * 0.02,
                                  ),

                                  //ポイント獲得ボタン
                                  InkWell(
                                      onTap: () {
                                        if (!item['bool']) {
                                          item['bool'] = true;
                                          if (items.todayLists['id'] != null) {
                                            var missionList = items.todayLists['id'] as List<Map<String, dynamic>>;

                                            if (missionList.length > index) {
                                              missionList[index]['bool'] = true;
                                              setState(() {});
                                            }
                                          }

                                          //達成率
                                          if (items.todayLists['id'] is List<Map<String, dynamic>>) {
                                            //リスト取得
                                            List<Map<String, dynamic>> itemList = items.todayLists['id'];
                                            int totalItems = itemList.length;
                                            int trueItems = itemList.where((item) => item['bool'] == true).length; //判定

                                            if (totalItems > 0) {
                                              Achievement = (trueItems / totalItems) * 100.0; //用意している管理用の変数に代入
                                            }

                                            //100%になったら、、のイベント つまりスタンプの建設予定地
                                            if (Achievement == 100) {
                                              if (items.userInfo['stamp']['now'][6]) {
                                                items.userInfo['stamp']
                                                    ['now'] = [false, false, false, false, false, false, false];
                                                items.userInfo['stamp']['totalStampCard'] += 1;

                                                //おにゅーのかーどだよという主張をする建設予定地
                                              }

                                              //スタンプ押す場所の判定
                                              for (int i = 0; i < items.userInfo['stamp']['now'].length; i++) {
                                                if (!items.userInfo['stamp']['now'][i]) {
                                                  items.userInfo['stamp']['now'][i] = true;
                                                  break;
                                                }
                                              }
                                            }
                                          }

                                          //ぷるぷるぷるりくえすと

                                          //ポイントの獲得
                                          items.userInfo['points']['now']['erai'] += item['point'];
                                          items.userInfo['points']['total']['totemoerai'] += item['point'];

                                          // ポイント獲得ダイアログ
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible: true, //ダイアログ外をタップすることでとじられるように
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                insetPadding: EdgeInsets.symmetric(
                                                    horizontal: 0.0), // 横幅を画面いっぱいにするためにcontentPaddingを調整
                                                // shape: RoundedRectangleBorder(
                                                //   borderRadius: BorderRadius.circular(16.0),
                                                //   side: const BorderSide(
                                                //     color: Constant.sub3,
                                                //     width: 5, // ダイアログの形状を変更
                                                //   ),
                                                // ),
                                                elevation: 0.0, // ダイアログの影を削除
                                                backgroundColor: Constant.white.withOpacity(0), // 背景色

                                                child: Container(
                                                  width: double.infinity,
                                                  height: _screenSizeHeight * 0.5,
                                                  child: Stack(
                                                    alignment: AlignmentDirectional.center,
                                                    //重ねて表示
                                                    children: <Widget>[
                                                      Container(
                                                        width: double.infinity,
                                                        height: _screenSizeHeight * 0.3,
                                                        decoration: const BoxDecoration(
                                                            color: Constant.sub3,
                                                            border: Border(
                                                                top: BorderSide(
                                                                  color: Constant.white,
                                                                  width: 10,
                                                                ),
                                                                bottom: BorderSide(color: Constant.white, width: 10))),
                                                      ),

                                                      // SizedBox(height: _screenSizeHeight * 0.05),
                                                      // // ほめことば
                                                      // CustomText(
                                                      //   color: Constant.black,
                                                      //   text: 'えらすぎ！',
                                                      //   fontSize: _screenSizeHeight * 0.03,
                                                      // ),
                                                      // SizedBox(height: _screenSizeHeight * 0.1),

                                                      // ニャリオット表示
                                                      Row(children: [
                                                        SizedBox(
                                                          width: _screenSizeWidth * 0.07,
                                                        ),
                                                        Image.asset(
                                                          items.Pictures[4],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ])
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(left: _screenSizeWidth * 0.018),
                                          width: _screenSizeWidth * 0.23,
                                          height: _screenSizeHeight * 0.05,
                                          alignment: const Alignment(0.0, 0.0),
                                          decoration: BoxDecoration(
                                              color: item['bool'] ? Constant.glay : Constant.sub3,
                                              borderRadius: BorderRadius.circular(10)), //角丸
                                          child: Row(children: [
                                            SizedBox(width: _screenSizeWidth * 0.02),
                                            //画像表示
                                            Container(
                                              width: _screenSizeWidth * 0.07,
                                              height: _screenSizeHeight * 0.07,
                                              child: Image.asset(items.money[0]), //建設予定地
                                            ),
                                            SizedBox(width: _screenSizeWidth * 0.025),

                                            //獲得ポイント表示
                                            CustomText(
                                                text: '${item['point']}',
                                                fontSize: _screenSizeHeight * 0.025,
                                                color: Constant.white),
                                          ]))),
                                ],
                              ),
                            ),
                          );
                        }).toList() ??
                        []))
          ]),
        ]),
      ))
    ]));
  }
}
