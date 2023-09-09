import 'package:flutter/material.dart';
import '../constant.dart';
import '../items.dart';

class PageDaily extends StatefulWidget {
  const PageDaily({Key? key}) : super(key: key);

  @override
  _PageDailyState createState() => _PageDailyState();
}

class _PageDailyState extends State<PageDaily> {
  @override
  Widget build(BuildContext context) {
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;
    //ミッション達成率
    var Achievement = items.todayList[2].where((element) => element == true).length / items.todayList[0].length * 100;

    return Scaffold(
        body: Center(
      child: Container(
        width: _screenSizeWidth,
        height: _screenSizeHeight,
        color: Constant.sub3,
        child: Column(children: [
          SizedBox(height: _screenSizeHeight * 0.02),
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
                          child:
                              CustomText(text: 'デイリーミッション', fontSize: _screenSizeWidth * 0.055, color: Constant.white),
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
                  children: items.todayList[0].asMap().entries.map<Widget>((entry) {
                int index = entry.key;
                String itemDayly = items.todayList[0][index]; // ミッションのリストから値を取得
                int itemPoint = items.todayList[1][index]; // 報酬Pのリストから値を取得
                bool itemBool = items.todayList[2][index]; // 達成の有無のリストから値を取得
                Color itemColor = items.todayList[3][index];
                Color itemBottunColor = items.todayList[4][index]; //達成の有無で色を変更

                //ここから表示部分
                return ListTile(
                  title: Container(
                    margin: EdgeInsets.all(_screenSizeWidth * 0.025),
                    padding: EdgeInsets.all(_screenSizeWidth * 0.025),
                    decoration: BoxDecoration(
                      color: itemColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: _screenSizeWidth * 0.03,
                        ),
                        //画像表示
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Constant.glay,
                          backgroundImage: AssetImage('images/choki.png'),
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
                            text: itemDayly,
                            fontSize: _screenSizeHeight * 0.02,
                          ),
                        ),

                        SizedBox(
                          width: _screenSizeWidth * 0.02,
                        ),

                        //ポイント獲得ボタン
                        InkWell(
                            onTap: () {
                              if (!itemBool) {
                                items.todayList[2][index] = true;
                                items.todayList[3][index] = Constant.glay;
                                items.todayList[4][index] = Constant.glay;

                                // ポイント獲得ダイアログ
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true, // ユーザーがダイアログ外をタップして閉じられないようにする
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        side: const BorderSide(
                                          color: Constant.sub3,
                                          width: 5, // ダイアログの形状を変更
                                        ),
                                      ),
                                      elevation: 0.0, // ダイアログの影を削除
                                      backgroundColor: Constant.white, // 背景色
                                      content: Container(
                                        width: _screenSizeWidth * 0.5,
                                        height: _screenSizeHeight * 0.6,
                                        child: Column(
                                          children: [
                                            SizedBox(height: _screenSizeHeight * 0.05),
                                            // ほめことば
                                            CustomText(
                                              color: Constant.black,
                                              text: 'えらすぎ！',
                                              fontSize: _screenSizeHeight * 0.03,
                                            ),
                                            SizedBox(height: _screenSizeHeight * 0.1),
                                            // ニャリオット表示
                                            Container(
                                              width: _screenSizeWidth * 0.7,
                                              height: _screenSizeWidth * 0.6,
                                              child: Image.asset(
                                                'images/cat.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
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
                                decoration:
                                    BoxDecoration(color: itemBottunColor, borderRadius: BorderRadius.circular(10)), //角丸
                                child: Row(children: [
                                  SizedBox(width: _screenSizeWidth * 0.02),
                                  //商品画像表示
                                  Container(
                                    width: _screenSizeWidth * 0.07,
                                    height: _screenSizeHeight * 0.07,
                                    child: Image.asset(items.money[0]),
                                  ),
                                  SizedBox(width: _screenSizeWidth * 0.025),

                                  //消費ポイント表示
                                  CustomText(
                                      text: '$itemPoint', fontSize: _screenSizeHeight * 0.025, color: Constant.white),
                                ]))),
                      ],
                    ),
                  ),
                );
              }).toList()))
        ]),
      ),
    ));
  }
}
