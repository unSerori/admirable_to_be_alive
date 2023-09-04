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
  static String name = 'うんちる';
  //好感度ランク
  static int rank = 0;

  //えらいいねとすごいいね
  static int erai = 0;
  static int good = 0;

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

    return Scaffold(
      body: Center(
          //ページの中身
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Constant.white),
        child: Column(
          children: [
            Container(
                width: _screenSizeWidth,
                height: _screenSizeWidth * 0.18,
                child: Row(
                  children: [
                    //好感度ランクの表示
                    
                    Container(
                      // child Widgetの位置を中央に指定
                      alignment: const Alignment(0.0, 0.0),
                      width: _screenSizeWidth * 0.18,
                      height: _screenSizeWidth * 0.18,
                      decoration: BoxDecoration(
                        color: Constant.main,
                        borderRadius: BorderRadius.circular(10), //角丸
                      ),
                      child: CustomText(
                        color: Constant.white,
                        text: rank.toString(),
                        fontSize: _screenSizeWidth * 0.10,
                      ),
                    ),

                    //名前とポイント部分
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(0.0, 0.0),
                          width: _screenSizeWidth * 0.5,
                          child: CustomText(
                            color: Constant.black,
                            text: name,
                            fontSize: _screenSizeWidth * 0.05,
                          ),
                        ),
                        Row(
                          children: [
                            //えらいいね
                            SizedBox(
                              width: _screenSizeWidth * 0.09,
                              height: _screenSizeWidth * 0.09,
                              child: Image.asset(
                                'images/gezi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: _screenSizeWidth * 0.09,
                              child: CustomText(
                                  color: Constant.black,
                                  text: '$erai P',
                                  fontSize: _screenSizeWidth * 0.05),
                            ),

                            //Spacer(),

                            //すごいいね
                            SizedBox(
                              width: _screenSizeWidth * 0.09,
                              height: _screenSizeWidth * 0.09,
                              child: Image.asset(
                                'images/usagi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: _screenSizeWidth * 0.09,
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
                          size: 40,
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
                            size: 60,
                          ),
                          onPressed: () {},
                        ),
                      ),

                      SizedBox(
                        height: _screenSizeWidth * 0.06,
                      ),

                      //カレンダー
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.event,
                            color: Constant.sub2,
                            size: 60,
                          ),
                          onPressed: () {},
                        ),
                      ),

                      SizedBox(
                        height: _screenSizeWidth * 0.06,
                      ),

                      //にくきゅうアイコン
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.pets,
                            color: Constant.sub1,
                            size: 60,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: _screenSizeWidth * 0.15,
                  ),
                
                  Column(
                    children:[
                      const SizedBox(
                        height: 30,
                      ),
                    //次の予定
                      Container(
                        alignment: const Alignment(0.0, 0.0),
                        width: _screenSizeWidth * 0.6,
                        height: _screenSizeWidth * 0.25,
                        decoration: BoxDecoration(
                          color: Constant.main,
                          borderRadius: BorderRadius.circular(10), //角丸
                        ),
                        child: CustomText(
                            text: '$nextToDoh:$nextToDom\n $nextToDo',
                            fontSize: _screenSizeWidth * 0.04,
                            color: Constant.white),
                      )
                    ]
                  )
                ],
              ),
            ),

            SizedBox(
              width: _screenSizeWidth * 0.1,
              height: _screenSizeWidth * 0.1,
            ),

            //ニャリオット
            SizedBox(
              height: _screenSizeWidth * 0.9,
              child: Image.asset(
                'images/cat.png',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              width: _screenSizeWidth * 0.1,
              height: _screenSizeWidth * 0.1,
            ),


            //せりふ部分
            Container(
              alignment: const Alignment(0.0, 0.0),
              width: _screenSizeWidth * 0.8,
              height: _screenSizeWidth * 0.25,
              decoration: BoxDecoration(
                color: Constant.main,
                borderRadius: BorderRadius.circular(10), //角丸
              ),
              child: CustomText(
                  text: word,
                  fontSize: _screenSizeWidth * 0.04,
                  color: Constant.white),
            )
          ],
        ),
      )),
    );
  }
}
