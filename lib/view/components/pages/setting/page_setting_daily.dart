import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../items.dart';

// デイリーミッション設定画面遷移先
class settingDaily extends StatefulWidget {
  const settingDaily({Key? key}) : super(key: key);

  @override
  _settingDaily createState() => _settingDaily();
}

class _settingDaily extends State<settingDaily> {
  @override
  Widget build(BuildContext context) {
    //画面サイズ
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;

    //編集中の保存用変数
    String things = 'ニャリオットにやさしくする';
    int points = 100;
    //int iconImageNumber = items.iconNumber;

    return Scaffold(
        body: Center(
            child: Container(
      width: _screenSizeWidth,
      height: _screenSizeHeight,
      alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
      padding: EdgeInsets.all(_screenSizeWidth * 0.01),
      decoration: const BoxDecoration(
        color: Constant.sub3,
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
            Align(
                alignment: Alignment.centerLeft, //左寄せに配置
                child: Row(children: [
                  SizedBox(
                    width: _screenSizeWidth * 0.02,
                  ),
                  Container(
                    width: _screenSizeWidth * 0.65,
                    height: _screenSizeHeight * 0.05,
                    alignment: const Alignment(0.0, 0.5), //文字配置位置調整
                    child: CustomText(text: 'ミッション編集', fontSize: _screenSizeWidth * 0.055, color: Constant.white),
                  )
                ])),

            //ミッション追加
            IconButton(
              icon: Icon(
                color: Constant.white,
                Icons.add,
                size: 35,
              ),
              onPressed: () {
                // 編集ダイアログ
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
                        height: _screenSizeHeight * 0.4,
                        child: Column(
                          children: [
                            SizedBox(height: _screenSizeHeight * 0.02),

                            //アイコン選択
                            InkWell(
                              onTap: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Container(
                                        child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      elevation: 0.0,
                                      backgroundColor: Constant.white.withOpacity(0),
                                      content: Builder(builder: (BuildContext context) {
                                        return Container(
                                          width: _screenSizeWidth,
                                          height: _screenSizeHeight * 0.4,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  iconPictures(picture: 0),
                                                  iconPictures(picture: 1),
                                                  iconPictures(picture: 2),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  iconPictures(picture: 3),
                                                  iconPictures(picture: 4),
                                                  iconPictures(picture: 5),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ));
                                  },
                                ).then((value) {
                                  setState(() {
                                    // ここにsetStateで更新したい内容を追加
                                  });
                                });
                              },
                              child: //画像表示
                                  CircleAvatar(
                                radius: 40,
                                backgroundColor: Constant.glay,
                                backgroundImage: AssetImage(items.icons[items.iconNumber]),
                              ),
                            ),

                            SizedBox(
                              height: _screenSizeHeight * 0.0175,
                            ),

                            //ポイント入力フォーム
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: _screenSizeWidth * 0.0175),
                                width: _screenSizeWidth * 0.2,
                                height: _screenSizeHeight * 0.04,
                                alignment: const Alignment(0.0, 0.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  decoration: InputDecoration(
                                    suffixText: 'P',
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: '${items.points.toString()} P',
                                    hintStyle: TextStyle(fontSize: 12),
                                  ),
                                  onChanged: (text) {
                                    points = int.parse(text);
                                  },
                                ),
                              ),
                            ),

                            //内容入力フォーム
                            Container(
                                width: _screenSizeWidth * 0.8,
                                height: _screenSizeHeight * 0.15,
                                child: Column(children: [
                                  SizedBox(height: _screenSizeHeight * 0.01),
                                  Container(
                                    width: _screenSizeWidth * 0.55,
                                    height: _screenSizeHeight * 0.1,
                                    alignment: const Alignment(0.0, 0.0),
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: items.things,
                                        hintStyle: TextStyle(fontSize: 12),
                                      ),
                                      onChanged: (text) {
                                        things = text;
                                      },
                                    ),
                                  )
                                ])),

                            // ボタン
                            Align(
                                alignment: Alignment.topCenter, //適用されてないな～～～; ;
                                child: Row(
                                  children: [
                                    SizedBox(width: _screenSizeWidth * 0.05),
                                    // 保存ボタン
                                    InkWell(
                                        onTap: () {
                                          var newItem = {
                                            "things": things,
                                            "point": points,
                                            "bool": false,
                                            "picture": items.iconNumber,
                                          };
                                          items.nextDayList["id"].add(newItem);

                                          setState(() {}); // 画面の更新
                                          Navigator.of(context).pop(); //もどる
                                        },
                                        child: Container(
                                          width: _screenSizeWidth * 0.23,
                                          height: _screenSizeHeight * 0.05,
                                          alignment: const Alignment(0.0, 0.0),
                                          decoration: BoxDecoration(
                                              color: Constant.sub3, borderRadius: BorderRadius.circular(10)), //角丸
                                          child: CustomText(
                                              text: '保存', fontSize: _screenSizeHeight * 0.02, color: Constant.white),
                                        )),

                                    SizedBox(width: _screenSizeWidth * 0.025),

                                    //やめるボタン
                                    InkWell(
                                        onTap: () {
                                          setState(() {});
                                          Navigator.of(context).pop(); //もどる
                                        },
                                        child: Container(
                                          width: _screenSizeWidth * 0.23,
                                          height: _screenSizeHeight * 0.05,
                                          alignment: const Alignment(0.0, 0.0),
                                          decoration: BoxDecoration(
                                              color: Constant.sub3, borderRadius: BorderRadius.circular(10)), //角丸
                                          child: CustomText(
                                              text: 'やめる', fontSize: _screenSizeHeight * 0.02, color: Constant.white),
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ));
                  },
                );
                setState(() {
                  //現在の状態の保存
                }); //画面の更新
              },
            ),
          ]),
          SizedBox(height: _screenSizeHeight * 0.025),

          //ミッションリスト
          Container(
              height: _screenSizeHeight * 0.85,
              child: ListView(
                  children: (items.nextDayList['id'] as List<Map<String, dynamic>>?)?.map<Widget>((item) {
                        //['id']の中の要素数の取得
                        int index =
                            (items.nextDayList['id'] as List<Map<String, dynamic>>?)?.indexOf(item) ?? -1; //null除外

                        //ここから表示部分
                        return ListTile(
                            title: InkWell(
                          //各コンテナをタップで編集画面に入れる(素敵すぎる)
                          onTap: () {
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
                                    height: _screenSizeHeight * 0.4,
                                    child: Column(
                                      children: [
                                        SizedBox(height: _screenSizeHeight * 0.02),

                                        //アイコン選択
                                        InkWell(
                                          onTap: () {
                                            showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return Container(
                                                    child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(16.0),
                                                  ),
                                                  elevation: 0.0,
                                                  backgroundColor: Constant.white.withOpacity(0),
                                                  content: Builder(builder: (BuildContext context) {
                                                    return Container(
                                                      width: _screenSizeWidth,
                                                      height: _screenSizeHeight * 0.4,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              iconPictures(picture: 0),
                                                              iconPictures(picture: 1),
                                                              iconPictures(picture: 2),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              iconPictures(picture: 3),
                                                              iconPictures(picture: 4),
                                                              iconPictures(picture: 5),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                ));
                                              },
                                            ).then((value) {
                                              setState(() {
                                                // ここにsetStateで更新したい内容を追加
                                              });
                                            });
                                          },
                                          child: //画像表示
                                              CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Constant.glay,
                                            backgroundImage: AssetImage(items.icons[item["picture"]]),
                                          ),
                                        ),

                                        SizedBox(
                                          height: _screenSizeHeight * 0.0175,
                                        ),

                                        //ポイント入力フォーム
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: _screenSizeWidth * 0.0175),
                                            width: _screenSizeWidth * 0.2,
                                            height: _screenSizeHeight * 0.04,
                                            alignment: const Alignment(0.0, 0.0),
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                              decoration: InputDecoration(
                                                suffixText: 'P',
                                                filled: true,
                                                fillColor: Colors.grey.shade200,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide.none,
                                                ),
                                                hintText: '${item['point']}',
                                                hintStyle: TextStyle(fontSize: 12),
                                              ),
                                              onChanged: (text) {
                                                points = int.parse(text);
                                              },
                                            ),
                                          ),
                                        ),

                                        //内容入力フォーム
                                        Container(
                                            width: _screenSizeWidth * 0.8,
                                            height: _screenSizeHeight * 0.15,
                                            child: Column(children: [
                                              SizedBox(height: _screenSizeHeight * 0.01),
                                              Container(
                                                width: _screenSizeWidth * 0.55,
                                                height: _screenSizeHeight * 0.1,
                                                alignment: const Alignment(0.0, 0.0),
                                                child: TextField(
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  maxLines: 2,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey.shade200,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide.none,
                                                    ),
                                                    hintText: item['things'],
                                                    hintStyle: TextStyle(fontSize: 12),
                                                  ),
                                                  onChanged: (text) {
                                                    things = text;
                                                  },
                                                ),
                                              )
                                            ])),

                                        // ボタン
                                        Align(
                                            alignment: Alignment.topCenter, //適用されてないな～～～; ;
                                            child: Row(
                                              children: [
                                                SizedBox(width: _screenSizeWidth * 0.05),
                                                // 保存ボタン
                                                InkWell(
                                                    onTap: () {
                                                      var newItem = {
                                                        "things": things,
                                                        "point": points,
                                                        "bool": false,
                                                        "picture": items.iconNumber,
                                                      };
                                                      items.nextDayList["id"][index] = newItem;

                                                      setState(() {}); // 画面の更新
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
                                                          text: '保存',
                                                          fontSize: _screenSizeHeight * 0.02,
                                                          color: Constant.white),
                                                    )),

                                                SizedBox(width: _screenSizeWidth * 0.025),

                                                //やめるボタン
                                                InkWell(
                                                    onTap: () {
                                                      items.nextDayList["id"].removeAt(index);
                                                      setState(() {});
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
                                                          text: '削除',
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
                          },

                          child: Container(
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
                                  backgroundImage: AssetImage(items.icons[item["picture"]]),
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
                                    onTap: () {},
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
                        ));
                      }).toList() ??
                      []))
        ],
      ),
    )));
  }
}
