import 'package:admirable_to_be_alive_/view/components/pages/page_daily.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

//管理が必要な変数などをまとめておく場所
class items {
  //えらいいねとすごいいね
  static int erai = 10;
  static int good = 80;

  //交換に必要なもの
  static List money = [Pictures[1], Pictures[0]];

  //交換所の中身
  static List itemList = [
    //えらいいね
    [
      //商品名
      ['にゃんちゅーる', 'おさかな', 'きばん', 'ねじ', 'ワイヤー', 'おみず'],
      //画像のパス
      //むいむい仮置中
      [
        Pictures[1],
        Pictures[1],
        Pictures[1],
        Pictures[1],
        Pictures[1],
        Pictures[1],
      ],
      //必要交換P
      [100, 250, 800, 25, 300, 10],

      //説明
      [
        'ちゅーるちゅーるにゃんちゅーる',
        'かわいげのないむいむい',
        'ちょっときもちわるいむいむい',
        'げんきなむいむい',
        'がんばってるむいむい',
        'ころしてくれとさけぶむいむい',
      ]
    ],

    //すごいいね
    [
      //商品名
      ['うさぎ', 'うさぎ', 'うさぎ', 'うさぎ', 'うさぎ', 'うさぎ'],

      //画像のパス
      //うさぎ仮置中
      [
        Pictures[0],
        Pictures[0],
        Pictures[0],
        Pictures[0],
        Pictures[0],
        Pictures[0],
      ],

      //必要交換P
      [100, 250, 800, 25, 300, 10],

      //説明
      [
        'ちゅーるちゅーるにゃんうさぎちゃん',
        'かわいげのないうさぎ',
        'べりーきゅーとうさぎ',
        'げんきなうさぎ',
        'がんばってるうさぎ',
        'ころしてくれとさけぶうさぎ',
      ]
    ],
  ];

  //画像のパス
  static List<String> Pictures = [
    'assets/images/usagi.png', //うさぎ 0
    'assets/images/gezi.png', //むいむい 1
    'assets/images/cat.png', //ねこ 2
    'assets/images/choki.png', //チョキ 3
    'assets/images/ichiban.PNG', //いちばん 4
  ];

  //これでつくるとあとで困りそうなんですけれどひとまず ひとまず、、、、
  //今日のデイリーミッション
  static Map<String, dynamic> todayLists = {
    "id": [
      {
        "things": 'あさごはんたべる',
        "point": 20,
        "bool": false,
      },
      {
        "things": 'おうちでる',
        "point": 20,
        "bool": false,
      },
      {
        "things": 'でんしゃのる',
        "point": 20,
        "bool": false,
      },
      {
        "things": 'おひるごはんちょうたつ',
        "point": 20,
        "bool": false,
      },
      {
        "things": 'じゅぎょうでねない',
        "point": 20,
        "bool": false,
      },
      {
        "things": 'おうちかえる',
        "point": 20,
        "bool": false,
      },
    ]
  };

  static List<Widget> children = [];

  //明日のデイリーミッション
  static List nextdayList = [
    //内容
    ['あさごはんたべる', 'おうちでる', 'でんしゃのる', 'おひるごはんちょうたつ'],
    //報酬P
    [20, 50, 40, 20],
    //達成の有無
    [false, false, false, false]
  ];

  

  //ミッション達成率
  double calculateTruePercentage(Map<String, dynamic> items) {
    if (items['id'] is List<Map<String, dynamic>>) {
      List<Map<String, dynamic>> itemList = items['id'];
      int totalItems = itemList.length;
      int trueItems = itemList.where((item) => item['bool'] == true).length;

      if (totalItems > 0) {
        return (trueItems / totalItems) * 100.0;
      }
    }

    return 0.0; // リストが存在しないか、要素が0の場合は0%を返す
  }

  void main() {
    PageDailyState.Achievement = calculateTruePercentage(todayLists);
  }
}
