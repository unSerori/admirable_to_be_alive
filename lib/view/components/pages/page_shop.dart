import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../items.dart';

class PageShop extends StatefulWidget {
  const PageShop({Key? key}) : super(key: key);

  @override
  _PageShopState createState() => _PageShopState();
}

class _PageShopState extends State<PageShop> {
  //交換所の色
  static List<Color> shopColor = [Constant.white, Constant.sub3];
  static List<Color> reverseShopColor = [Constant.sub3, Constant.white];
  static List<Color> shopFontColor = [Constant.black, Constant.white];
  static List<Color> reverseshopFontColor = [Constant.white, Constant.black];

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
        decoration: const BoxDecoration(color: Constant.sub1),
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
                width: _screenSizeWidth * 0.225,
              ),
              Container(
                width: _screenSizeWidth * 0.25,
                height: _screenSizeHeight * 0.05,
                alignment: const Alignment(0.0, 0.5), //文字配置位置調整
                child: CustomText(text: 'ショップ', fontSize: _screenSizeWidth * 0.055, color: Constant.white),
              )
            ]),

            SizedBox(height: _screenSizeHeight * 0.025),

            //スタンプカード
            Container(
                //margin: EdgeInsets.all(_screenSizeHeight * 0.05),
                width: _screenSizeWidth * 0.9,
                height: _screenSizeHeight * 0.3,
                decoration: BoxDecoration(
                  color: Constant.sub3,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(_screenSizeWidth * 0.03),
                            child: Row(
                              children: [
                                CustomText(text: 'スタンプカード', fontSize: _screenSizeWidth * 0.05, color: Constant.white),
                                SizedBox(
                                  width: _screenSizeWidth * 0.3,
                                ),
                                CustomText(text: 'No.', fontSize: _screenSizeWidth * 0.05, color: Constant.white),
                                Container(
                                  width: _screenSizeWidth * 0.1,
                                  height: _screenSizeHeight * 0.03,
                                  alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
                                  decoration:
                                      BoxDecoration(color: Constant.white, borderRadius: BorderRadius.circular(5)),
                                  // スタンプカード枚数
                                  child: CustomText(
                                      text: items.userInfo['stamp']['totalStampCard'].toString(),
                                      fontSize: _screenSizeWidth * 0.04,
                                      color: Constant.blackGlay),
                                )
                              ],
                            )),

                        // スタンプ部分
                        Container(
                          width: _screenSizeWidth * 0.8,
                          height: _screenSizeHeight * 0.23,
                          // padding: EdgeInsets.only(left: _screenSizeWidth * 0.01),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][0]),
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][1]),
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][2]),
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][3]),
                                ],
                              ),
                              Row(
                                children: [
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][4]),
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][5]),
                                  stampBox.stampBox2(_screenSizeWidth, items.userInfo['stamp']['now'][6]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: _screenSizeWidth * 0.1,
                      left: _screenSizeHeight * 0.325,
                      child: Container(
                        width: _screenSizeWidth * 0.3525,
                        height: _screenSizeHeight * 0.3525,
                        alignment: const Alignment(0.0, 0.0),
                        child: Image.asset(
                          items.Pictures[8],
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                )),

            SizedBox(
              height: _screenSizeHeight * 0.03,
            ),

            Container(
                child: Row(children: [
              SizedBox(
                width: _screenSizeWidth * 0.035,
              ),
              Column(children: [
                Row(children: [
                  // 交換所タブ
                  // えらいいね
                  InkWell(
                    onTap: () {
                      shopIndex = 0; // indexの変更で参照するリストを操作している
                      setState(() {}); //tapで画面更新
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
                        child: Row(children: [
                          SizedBox(width: _screenSizeWidth * 0.08),
                          Container(
                            width: _screenSizeWidth * 0.1,
                            height: _screenSizeHeight * 0.07,
                            child: Image.asset(items.money[0]), // 交換に必要なむいむいの画像
                          ),
                          SizedBox(width: _screenSizeWidth * 0.02),
                          CustomText(
                              text: '${items.userInfo['points']['now']['erai']} 匹',
                              fontSize: _screenSizeHeight * 0.025,
                              color: Constant.black),
                        ])),
                  ),
                  //すごいいね
                  InkWell(
                    onTap: () {
                      shopIndex = 1; // indexの変更で参照するリストを操作している
                      setState(() {}); // tapで画面更新
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
                        child: Row(children: [
                          SizedBox(width: _screenSizeWidth * 0.08),
                          Container(
                            width: _screenSizeWidth * 0.1,
                            height: _screenSizeHeight * 0.07,
                            child: Image.asset(items.money[1]), // 交換に必要なうさぎさんの画像
                          ),
                          SizedBox(width: _screenSizeWidth * 0.02),
                          CustomText(
                              text: '${items.userInfo['points']['now']['good']} 匹',
                              fontSize: _screenSizeHeight * 0.025,
                              color: Constant.white),
                        ])),
                  ),
                ]),

                //交換所
                Container(
                  width: _screenSizeWidth * 0.9,
                  height: _screenSizeHeight * 0.48,
                  decoration: BoxDecoration(
                    color: shopColor[shopIndex],
                    //下部分角丸
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),

                  //リスト部分
                  child: ListView(
                    children: (items.itemList_['shops'][shopIndex] as List<Map<String, dynamic>>).map<Widget>((item) {
                      // 'shops'内の要素数の取得
                      int index = (items.itemList_['shops'][shopIndex] as List<Map<String, dynamic>>?)?.indexOf(item) ??
                          -1; // null除外
                      // ここから交換品リスト
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
                                    items.itemList_['shops'][shopIndex][index]['itemPicture'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: _screenSizeWidth * 0.05,
                                ),
                                // 商品名
                                CustomText(
                                  color: shopFontColor[shopIndex],
                                  text: items.itemList_['shops'][shopIndex][index]['itemName'],
                                  fontSize: _screenSizeHeight * 0.02,
                                ),
                              ])),
                              Align(
                                alignment: Alignment.centerRight, // 右寄せに配置
                                // 必要ポイント
                                child: Row(children: [
                                  // 購入ボタン
                                  InkWell(
                                    // ここからしばらく押したときの動作
                                    onTap: () {
                                      //購入確認ダイアログ
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false, // ユーザーがダイアログ外をタップして閉じられないようにする
                                        builder: (BuildContext context) {
                                          return Container(
                                              child: AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16.0),
                                              side: const BorderSide(
                                                color: Constant.sub3, width: 5, // ダイアログの形状を変更
                                              ),
                                            ),
                                            elevation: 0.0, // ダイアログの影を削除
                                            backgroundColor: Constant.white, // 背景色

                                            content: Container(
                                              width: _screenSizeWidth * 0.5,
                                              height: _screenSizeHeight * 0.35,
                                              child: Column(
                                                children: [
                                                  SizedBox(height: _screenSizeHeight * 0.01),

                                                  // 商品名
                                                  CustomText(
                                                    color: Constant.black,
                                                    text: items.itemList_['shops'][shopIndex][index]['itemName'],
                                                    fontSize: _screenSizeHeight * 0.03,
                                                  ),
                                                  SizedBox(height: _screenSizeHeight * 0.01),
                                                  // 画像
                                                  Container(
                                                    width: _screenSizeWidth * 0.3,
                                                    height: _screenSizeWidth * 0.3,
                                                    child: Image.asset(
                                                      items.itemList_['shops'][shopIndex][index]['itemPicture'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  // 説明
                                                  Container(
                                                    height: _screenSizeHeight * 0.07,
                                                    alignment: const Alignment(0.0, 0.0),
                                                    child: CustomText(
                                                      color: Constant.black,
                                                      text: items.itemList_['shops'][shopIndex][index]['itemInfo'],
                                                      fontSize: _screenSizeHeight * 0.02,
                                                    ),
                                                  ),

                                                  // ボタン
                                                  Align(
                                                      alignment: Alignment.bottomCenter, //下寄せ
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width: _screenSizeWidth * 0.05),
                                                          // 購入確定ボタン
                                                          InkWell(
                                                              onTap: () {
                                                                // えらいいねショップ
                                                                if (shopIndex == 0) {
                                                                  // お金がたりない
                                                                  if (items.userInfo['points']['now']['erai'] >
                                                                      items.itemList_['shops'][shopIndex][index]
                                                                          ['itemPoint']) {
                                                                            items.userInfo['points']['now']['erai'] -=
                                                                        items.itemList_['shops'][shopIndex][index]
                                                                            ['itemPoint']; // えらいいねポイントの消費
                                                                    Navigator.of(context).pop(); //前の画面に戻る
                                                                  }
                                                                    
                                                    
                                                                    
                                                                  // すごいいねショップ
                                                                } else {
                                                                  if (items.userInfo['points']['now']['good'] >
                                                                      items.itemList_['shops'][shopIndex][index]
                                                                          ['itemPoint']) {

                                                                             items.userInfo['points']['now']['good'] -=
                                                                        items.itemList_['shops'][shopIndex][index]
                                                                            ['itemPoint']; // すごいいねポイントの消費
                                                                    Navigator.of(context).pop(); //前の画面に戻る
                                                                    
                                                                  } 
                                                                }
                                                                setState(() {}); // 画面の更新
                                                                
                                                              },
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets.only(left: _screenSizeWidth * 0.018),
                                                                  width: _screenSizeWidth * 0.23,
                                                                  height: _screenSizeHeight * 0.05,
                                                                  alignment: const Alignment(0.0, 0.0),
                                                                  decoration: BoxDecoration(
                                                                      color:items.userInfo['points']['now']['erai'] <
                                                                      items.itemList_['shops'][shopIndex][index]
                                                                          ['itemPoint'] ?Constant.red : Constant.sub3,
                                                                      borderRadius: BorderRadius.circular(10)), //角丸
                                                                  child: Row(children: [
                                                                    //消費されるむいむいまたはうさぎさんの画像
                                                                    Container(
                                                                      width: _screenSizeWidth * 0.1,
                                                                      height: _screenSizeHeight * 0.07,
                                                                      child: Image.asset(items.money[shopIndex]),
                                                                    ),
                                                                    SizedBox(width: _screenSizeWidth * 0.005),

                                                                    //消費ポイント表示
                                                                    CustomText(
                                                                        text:
                                                                            '${items.itemList_['shops'][shopIndex][index]['itemPoint']}',
                                                                        fontSize: _screenSizeHeight * 0.025,
                                                                        color: Constant.white),
                                                                  ]))),

                                                          SizedBox(width: _screenSizeWidth * 0.025),

                                                          //やめるボタン
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.of(context).pop(); //もどる
                                                              },
                                                              child: Container(
                                                                width: _screenSizeWidth * 0.23,
                                                                height: _screenSizeHeight * 0.05,
                                                                alignment: const Alignment(0.0, 0.0),
                                                                decoration: BoxDecoration(
                                                                    color: Constant.sub3,
                                                                    borderRadius: BorderRadius.circular(10)), //角丸
                                                                child: CustomText(
                                                                    text: 'やめる',
                                                                    fontSize: _screenSizeHeight * 0.02,
                                                                    color: Constant.white),
                                                              )),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ));
                                        },
                                      );
                                      setState(() {}); //画面の更新
                                    },
                                    //購入ボタンの見た目
                                    child: Container(
                                      width: _screenSizeWidth * 0.2,
                                      height: _screenSizeHeight * 0.05,
                                      alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
                                      decoration: BoxDecoration(
                                          color: reverseShopColor[shopIndex],
                                          borderRadius: BorderRadius.circular(10)), //角丸
                                      child: CustomText(
                                        color: reverseshopFontColor[shopIndex],
                                        text:
                                            '${items.itemList_['shops'][shopIndex][index]['itemPoint']} 匹', // ポイントを文字列に変換
                                        fontSize: _screenSizeHeight * 0.025,
                                      ),
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
