import 'package:flutter/material.dart';
import '../constant.dart';
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

  //えらいいねとすごいいね
  static int erai = 10;
  static int good = 80;

  //次の予定
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

            Container(
                width: _screenSizeWidth,
                height: _screenSizeHeight * 0.1,
                child: Row(
                  children: [
                    //好感度ランクの表示
                    MainBox.MainBox2(
                        CustomText(
                            text: rank.toString(),
                            fontSize: _screenSizeWidth * 0.08,
                            color: Constant.white),
                        _screenSizeWidth.toDouble(),
                        _screenSizeWidth.toDouble(),
                        0.18,
                        0.18),

                    SizedBox(
                      width: _screenSizeWidth * 0.07,
                    ),

                    //名前とポイント部分
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(0.0, 0.0),
                          width: _screenSizeWidth * 0.5,
                          padding:
                              EdgeInsets.only(bottom: _screenSizeWidth * 0.01),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Constant.glay,
                            width: 3,
                          ))),
                          child: CustomText(
                            color: Constant.black,
                            text: name,
                            fontSize: _screenSizeWidth * 0.05,
                          ),
                        ),
                        Row(
                          children: [
                            //えらいいね
                            Container(
                              width: _screenSizeWidth * 0.09,
                              height: _screenSizeWidth * 0.09,
                              padding:
                                  EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child: Image.asset(
                                'images/gezi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: _screenSizeWidth * 0.15,
                              padding:
                                  EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child: CustomText(
                                  color: Constant.black,
                                  text: '$erai P',
                                  fontSize: _screenSizeWidth * 0.05),
                            ),

                            //すごいいね
                            Container(
                              width: _screenSizeWidth * 0.09,
                              height: _screenSizeWidth * 0.1,
                              padding:
                                  EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child: Image.asset(
                                'images/usagi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: _screenSizeWidth * 0.15,
                              padding:
                                  EdgeInsets.only(top: _screenSizeWidth * 0.01),
                              child: CustomText(
                                  color: Constant.black,
                                  text: '$good P',
                                  fontSize: _screenSizeWidth * 0.05),
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
                          // //ページ遷移
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const PageSetAlarm_2()),
                          // ).then((value) {
                          //   //戻ってきたら再描画
                          //   setState(() {});
                          // });
                        },
                      ),
                    ),
                  ],
                )),

            //二段目
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      //デイリーミッション
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.auto_awesome,
                            color: Constant.sub3,
                            size: 50,
                          ),
                          onPressed: () {},
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
                            size: 50,
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
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: _screenSizeWidth * 0.15,
                  ),
                  Column(children: [
                    const SizedBox(
                      height: 30,
                    ),

                    //次の予定
                    MainBox.MainBox2(
                        CustomText(
                            text: '$nextToDoh:$nextToDom\n $nextToDo',
                            fontSize: _screenSizeWidth * 0.04,
                            color: Constant.white),
                        _screenSizeWidth.toDouble(),
                        _screenSizeHeight.toDouble(),
                        0.6,
                        0.2), 
                    
                  ])
                ],
              ),
            ),

            //ニャリオット
            SizedBox(
              height: _screenSizeWidth * 0.8,
              child: Image.asset(
                'images/cat.png',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              width: _screenSizeWidth * 0.1,
              height: _screenSizeWidth * 0.03,
            ),

          //せりふ部分
          MainBox.MainBox2(
            CustomText(
              text: word,
              fontSize: _screenSizeWidth * 0.04,
              color: Constant.white),
            _screenSizeWidth.toDouble(),
            _screenSizeHeight.toDouble(),
            0.8,
            0.2), 
          ],
        ),
      )),
    );
  }
}
