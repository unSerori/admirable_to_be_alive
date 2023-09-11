import 'package:flutter/material.dart';
import '../constant.dart';
import '../items.dart';
import 'page_shop.dart';

import 'page_daily.dart';
import 'page_setting.dart';
// import '../app.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  //ユーザー名
  static String name = 'おさかな';
  //好感度ランク
  static int rank = 0;

  
  //次の予定
  //変更予定
  static int nextToDoh = 13;
  static int nextToDom = 30;
  static String nextToDo = '歯医者';

  //ニャリオットのせりふ
  static String word = 'えらすぎ！\n僕みたい!';

  @override
  Widget build(BuildContext context) {
    //画面サイズ
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          //ページの中身
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
        decoration: const BoxDecoration(color: Constant.white),
        child: Column(
          children: [
            SizedBox(
                width: _screenSizeWidth,
                height: _screenSizeHeight * 0.1,
                child: Row(
                  children: [
                    //好感度ランクの表示 正方形なのでmainbox使うと比率が面倒で個別に対応中
                    Container(
                      width: _screenSizeWidth * 0.18,
                      height: _screenSizeWidth * 0.18,
                      alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
                      decoration: BoxDecoration(
                        color: Constant.main,
                        borderRadius: BorderRadius.circular(10), //角丸
                      ),
                      child: Container(
                        alignment: const Alignment(0.0, 0.0),
                        width: _screenSizeWidth * 0.15,
                        height: _screenSizeWidth * 0.15,
                        decoration: BoxDecoration(
                          color: Constant.main,
                          borderRadius: BorderRadius.circular(10), //角丸
                          border: Border.all(
                            color: Constant.white,
                            width: 2,
                          ),
                        ),
                        child: CustomText(
                          text: items.userInfo['rank'].toString(),
                          fontSize: _screenSizeHeight * 0.05,
                          color: Constant.white,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: _screenSizeWidth * 0.07,
                    ),

                    //名前とポイント部分
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(0.0, 0.0),
                          width: _screenSizeWidth * 0.5,
                          padding: EdgeInsets.only(bottom: _screenSizeWidth * 0.01),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Constant.glay,
                            width: 3,
                          ))),
                          child: CustomText(
                            color: Constant.black,
                            text: items.userInfo['name'],
                            fontSize: _screenSizeWidth * 0.05,
                          ),
                        ),
                        Row(
                          children: [
                            //えらいいね
                            Container(
                              width: _screenSizeWidth * 0.09,
                              height: _screenSizeWidth * 0.09,
                              padding: EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child: Image.asset(
                                items.Pictures[1],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: _screenSizeWidth * 0.15,
                              padding: EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child:
                                  CustomText(color: Constant.black, text: '${items.userInfo['points']['now']['erai']}P', fontSize: _screenSizeWidth * 0.05),
                            ),

                            //すごいいね
                            Container(
                              width: _screenSizeWidth * 0.09,
                              height: _screenSizeWidth * 0.1,
                              padding: EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child: Image.asset(
                                items.Pictures[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: _screenSizeWidth * 0.15,
                              padding: EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child:
                                  CustomText(color: Constant.black, text: '${items.userInfo['points']['now']['good']}P', fontSize: _screenSizeWidth * 0.05),
                            ),
                          ],
                        )
                      ],
                    ),
                    //歯車アイコン
                    SizedBox(
                      child: IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Constant.glay,
                          size: 50,
                        ),
                        onPressed: () {
                          //ページ遷移
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageSetting()),
                          ).then((value) {
                            //戻ってきたら再描画
                            setState(() {});
                          });
                        },
                      ),
                    ),
                  ],
                )),

            //二段目
            Stack(//重ねて表示
                children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: _screenSizeWidth * 0.01,
                  ),
                  Column(
                    children: <Widget>[
                      //デイリーミッション
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.auto_awesome,
                            color: Constant.sub3,
                            size: 55,
                          ),
                          onPressed: () {
                            //ページ遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageDaily()),
                            ).then((value) {
                              //戻ってきたら再描画
                              setState(() {});
                            });
                          },
                        ),
                      ),

                      SizedBox(
                        height: _screenSizeHeight * 0.03,
                      ),

                      //カレンダー
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.event,
                            color: Constant.sub2,
                            size: 55,
                          ),
                          onPressed: () {},
                        ),
                      ),

                      SizedBox(
                        height: _screenSizeHeight * 0.03,
                      ),

                      //にくきゅうアイコン
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.pets,
                            color: Constant.sub1,
                            size: 55,
                          ),
                          onPressed: () {
                            //ページ遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageShop()),
                            ).then((value) {
                              //戻ってきたら再描画
                              setState(() {});
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: _screenSizeWidth * 0.15,
                  ),
                  Column(children: [
                    //次の予定
                    MainBox.MainBox2(
                        CustomText(
                            text: '$nextToDoh:$nextToDom\n $nextToDo',
                            fontSize: _screenSizeWidth * 0.04,
                            color: Constant.white),
                        _screenSizeWidth.toDouble(),
                        _screenSizeHeight.toDouble(),
                        0.6,
                        0.15),
                  ])
                ],
              ),
              Column(
                //ニャリオット
                children: [
                  //縦調整
                  SizedBox(
                    height: _screenSizeHeight * 0.2,
                  ),
                  Row(
                    children: [
                      //横調整
                      SizedBox(
                        width: _screenSizeWidth * 0.05,
                      ),
                      //画像
                      SizedBox(
                        height: _screenSizeWidth * 0.8,
                        child: Image.asset(
                          items.Pictures[2],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]),

            SizedBox(
              width: _screenSizeWidth * 0.1,
              height: _screenSizeWidth * 0.03,
            ),

            //せりふ部分
            MainBox.MainBox2(CustomText(text: word, fontSize: _screenSizeWidth * 0.04, color: Constant.white),
                _screenSizeWidth.toDouble(), _screenSizeHeight.toDouble(), 0.8, 0.16),
          ],
        ),
      )),
    );
  }
}
