import 'package:flutter/material.dart';
import '../constant.dart';

class PageShop extends StatefulWidget {
  const PageShop({Key? key}) : super(key: key);

  @override
  _PageShopState createState() => _PageShopState();
}

class _PageShopState extends State<PageShop> {
  //交換所の色
  static List<Color> shopColor = [Constant.white, Constant.sub1];
  static List<Color> reverseShopColor = [Constant.sub1, Constant.white];

  //交換所の中身
  List itemList = [
    //えらいいね
    [
      //商品名
      ['にゃんちゅーる', 'おさかな', 'きばん', 'ねじ', 'ワイヤー', 'おみず'],
      //画像のパス
      //むいむい仮置中
      [
        'images/gezi.png',
        'images/gezi.png',
        'images/gezi.png',
        'images/gezi.png',
        'images/gezi.png',
        'images/gezi.png',
      ],
      //必要交換P
      [100, 250, 800, 25, 300, 10],
    ],

    //すごいいね
    [
      //商品名
      ['うさぎ', 'うさぎ', 'うさぎ', 'うさぎ', 'うさぎ', 'うさぎ'],

      //画像のパス
      //うさぎ仮置中
      [
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
      ],

      //必要交換P
      [100, 250, 800, 25, 300, 10],
    ],
  ];

  //交換所選択用変数
  int shopIndex = 0;

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
        decoration: const BoxDecoration(color: Constant.main),
        child: Column(
          children: [

            //戻るボタン
            Align(
              alignment: Alignment.centerLeft,  //左寄せ
              child: Row(children: [
                SizedBox(width: _screenSizeWidth*0.05),
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
                SizedBox(width: _screenSizeWidth*0.25),
                CustomText(text: 'ショップ', fontSize: 20, color: Constant.white)
              ]),
            ),

            SizedBox(height: _screenSizeHeight*0.025),
            //スタンプカード えっ処理どうしよ、、、
            Container(
              //margin: EdgeInsets.all(_screenSizeHeight * 0.05),
              width: _screenSizeWidth * 0.9,
              height: _screenSizeHeight * 0.3,
              decoration: BoxDecoration(
                color: Constant.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            SizedBox(
              height: _screenSizeHeight * 0.02,
            ),

            Container(
                child: Row(children: [
              SizedBox(
                width: _screenSizeWidth * 0.035,
              ),
              Column(children: [
                Row(children: [
                  //交換所タブ
                  //えらいいね
                  InkWell(
                    onTap: () {
                      shopIndex = 0;
                      setState(() {});
                    },
                    child: Container(
                      width: _screenSizeWidth * 0.45,
                      height: _screenSizeHeight * 0.07,
                      decoration: BoxDecoration(
                        color: shopColor[0],
                        //上部分角丸
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Image.asset('images/gezi.png'),
                    ),
                  ),
                  //すごいいね
                  InkWell(
                    onTap: () {
                      shopIndex = 1;
                      setState(() {});
                    },
                    child: Container(
                      width: _screenSizeWidth * 0.45,
                      height: _screenSizeHeight * 0.07,
                      decoration: BoxDecoration(
                        color: shopColor[1],
                        //上部分角丸
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Image.asset('images/usagi.png'),
                    ),
                  ),
                ]),

                //交換所
                Container(
                  width: _screenSizeWidth * 0.9,
                  height: _screenSizeHeight * 0.48,
                  decoration: BoxDecoration(
                    color: shopColor[shopIndex],
                    //上部分角丸
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),

                  //リスト部分
                  child: ListView(
                    children: itemList[shopIndex][0]
                        .asMap() //リスト内の要素とインデックスをペアにしてとってきてくれる素敵なメソッド
                        .entries //マップ内の、、でasMapと同じようなことしてくれる素敵なメソッド
                        .map<Widget>((entry) {
                      //リストとかを新しく生成しなおしてくれる素敵なメソッド
                      int index = entry.key;
                      List<String> itemNames =
                          itemList[shopIndex][0]; // 商品名のリスト

                      String itemName = itemNames[index];

                      List<String> itemImages =
                          itemList[shopIndex][1]; // 画像パスのリスト
                      String itemImage = itemImages[index];

                      List<int> itemPoints = itemList[shopIndex][2];
                      int itemPoint = itemPoints[index]; //必要ポイントのリスト

                      //ここから交換品リスト
                      return ListTile(
                        title: Container(
                          margin: EdgeInsets.all(_screenSizeWidth * 0.025),
                          padding: EdgeInsets.all(_screenSizeWidth * 0.025),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(children: [
                                // 商品イメージ画像
                                Container(
                                  width: _screenSizeWidth * 0.08,
                                  height: _screenSizeWidth * 0.08,
                                  child: Image.asset(
                                    itemImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: _screenSizeWidth * 0.05,
                                ),
                                // 商品名
                                CustomText(
                                  color: Constant.black,
                                  text: itemName,
                                  fontSize: _screenSizeHeight * 0.02,
                                ),
                              ])),
                              Align(
                                alignment: Alignment.centerRight, // 右寄せに配置
                                // 必要ポイント
                                child: Row(children: [
                                  Container(
                                    width: _screenSizeWidth * 0.2,
                                    height: _screenSizeHeight * 0.05,
                                    alignment:
                                        const Alignment(0.0, 0.0), //文字を真ん中にする
                                    decoration: BoxDecoration(
                                        color: reverseShopColor[shopIndex],
                                        borderRadius:
                                            BorderRadius.circular(10)), //角丸
                                    child: CustomText(
                                      color: Constant.black,
                                      text: '$itemPoint P', // ポイントを文字列に変換
                                      fontSize: _screenSizeHeight * 0.025,
                                    ),
                                  ),
                                  SizedBox(
                                    width: _screenSizeWidth * 0.05,
                                  )
                                ]),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ])
            ])),
          ],
        ),
      ),
    ));
  }
}
