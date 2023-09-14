import 'package:admirable_to_be_alive_/view/components/pages/page_daily.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

//管理が必要な変数などをまとめておく場所
class items {
  //ユーザー情報
  //ユーザー情報は即更新せなあかんくない？とおもうのででいりーーと分けているのだがどう思いますかときく
  static Map<String, dynamic> userInfo = {
    'mail': "osakana@gmail.com",
    'name': "おさかな",
    'rank': 1,
    'points': {
      'now': {
        'erai': 0,
        'good': 0,
      },
      'total': {
        'totemoerai': 0,
        'totemogood': 0,
      }
    },
    'stamp': {
      'now': [false, false, false, false, false, false, false],
      'totalStampCard': 0,
    }
  };

  //交換に必要なもの
  static List money = [Pictures[1], Pictures[0]];

  //交換所の中身
  static Map itemList_ = {
    'shops': [
      //えらいいね
      [
        {'itemName': 'おみず', 'itemPoint': 10, 'itemInfo': 'いきものはおみずがないといきていけない', 'itemPicture': Pictures[7]},
        {'itemName': 'ねじ', 'itemPoint': 25, 'itemInfo': 'ちょっときもちわるいむいむい', 'itemPicture': Pictures[1]},
        {'itemName': 'にゃんちゅーる', 'itemPoint': 100, 'itemInfo': 'ちゅーるちゅーるにゃんちゅーる', 'itemPicture': Pictures[1]},
        {'itemName': 'おさかな', 'itemPoint': 250, 'itemInfo': 'ニャリオットのだいすきなおさかな。ちょっとなまぐさい', 'itemPicture': Pictures[9]},
        {'itemName': 'ワイヤー', 'itemPoint': 300, 'itemInfo': 'たべられます', 'itemPicture': Pictures[10]},
        {'itemName': 'きばん', 'itemPoint': 800, 'itemInfo': 'げんきなむいむい', 'itemPicture': Pictures[1]},
      ],

      //すごいいね
      [
        {'itemName': 'うさぎ', 'itemPoint': 10, 'itemInfo': 'がんばってるうさぎ', 'itemPicture': Pictures[0]},
        {'itemName': 'うさぎ', 'itemPoint': 25, 'itemInfo': 'かわいげのないうさぎ', 'itemPicture': Pictures[0]},
        {'itemName': 'うさぎ', 'itemPoint': 100, 'itemInfo': 'たべられます', 'itemPicture': Pictures[0]},
        {'itemName': 'うさぎ', 'itemPoint': 250, 'itemInfo': 'ちゅーるちゅーるねこうさぎ', 'itemPicture': Pictures[0]},
        {'itemName': 'うさぎ', 'itemPoint': 500, 'itemInfo': 'べりーきゅーとうさぎ', 'itemPicture': Pictures[0]},
        {'itemName': 'うさぎ', 'itemPoint': 800, 'itemInfo': 'ころしてくれとさけぶうさぎ', 'itemPicture': Pictures[0]},
      ]
    ]
  };

  //ニャリオットのせりふ
  static Map nyariot = {
    "home": [
      'えらすぎ！\n僕みたい!'
          'まいにち大変だけど\n今日ものりきろうね'
    ],
    "daily": ['えらい！！！！！'],
    "stamp": ['すごい！さすが${userInfo['name']}さん！'],
    "newStampCard": ['七日間よくがんばったね\nはい! 新しいカードだよ']
  };

  //画像のパス
  static List<String> Pictures = [
    'assets/images/usagi.png', //うさぎ 0
    'assets/images/gezi.png', //むいむい 1
    'assets/images/cat.png', //ねこ 2
    'assets/images/choki.png', //チョキ 3
    'assets/images/ichiban.PNG', //いちばん 4
    'assets/images/onemu.PNG', //おねむ 5
    'assets/images/stamp.png', //スタンプ 6
    'assets/images/water.PNG', //おみず 7
    'assets/images/goodCat.png', //スタンプカード用ねちこ 8
    'assets/images/fish.PNG', //おさかなさん 9
    'assets/images/wiyer.PNG', //ワイヤー 10
    'assets/images/fukidashi.png' //ふきだし 11
  ];

  static List<String> dailyPictures = [
    'assets/images/ichiban.PNG', //いちばん 4
    'assets/images/nyariot_0.PNG', //にばん
  ];

  static Map voice = {
    "daily": [
      "assetes/voice/erasugi.wav"
  ]};

  //icons
  static List<String> icons = [
    'assets/images/icons/cat_1.png',
    'assets/images/icons/cat_2.png',
    'assets/images/icons/cat_3.png',
    'assets/images/icons/cat_4.png',
    'assets/images/icons/cat_5.png',
    'assets/images/icons/cat_6.png',
  ];

    //icons
  static List<String> dailyPicture = [
    'assets/images/dailyPicture/cat_1.png',
    'assets/images/dailyPicture/cat_2.png',
    'assets/images/dailyPicture/cat_3.png',
    'assets/images/dailyPicture/cat_4.png',
    'assets/images/dailyPicture/cat_5.png',
    'assets/images/dailyPicture/cat_6.png',
  ];

  //今日のデイリーミッション
  static Map<String, dynamic> todayLists = {
    "id": [
      {"things": 'あさごはんたべる', "point": 20, "bool": false, "picture": 0},
      {"things": 'おうちでる', "point": 50, "bool": false, "picture": 1},
      {"things": 'でんしゃのる', "point": 20, "bool": false, "picture": 2},
      {"things": 'おひるごはんちょうたつ', "point": 20, "bool": false, "picture": 3},
      {"things": 'じゅぎょうでねない', "point": 30, "bool": false, "picture": 4},
      {"things": 'おうちかえる', "point": 20, "bool": false, "picture": 5},
    ]
  };

  //応急処置 技育までになおしたい所存
  static Map<String, dynamic> todayLists2 = {
    "id": [
      {"things": 'あさごはんたべる', "point": 20, "bool": false, "picture": 0},
      {"things": 'おうちでる', "point": 50, "bool": false, "picture": 1},
      {"things": 'でんしゃのる', "point": 20, "bool": false, "picture": 2},
      {"things": 'おひるごはんちょうたつ', "point": 20, "bool": false, "picture": 3},
      {"things": 'じゅぎょうでねない', "point": 30, "bool": false, "picture": 4},
      {"things": 'おうちかえる', "point": 20, "bool": false, "picture": 5},
    ]
  };

  //明日のデイリーミッション
  static Map<String, dynamic> nextDayList = Map.of(todayLists2); //リストのコピー
  //編集中の保存用変数
  static String things = 'ニャリオットにやさしくする';
  static int points = 100;
  static int iconNumber = 0;

  //返り値の一時保管場所
  static var dataKeep = [];
}
