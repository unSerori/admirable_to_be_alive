import 'package:admirable_to_be_alive_/view/components/pages/page_daily.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

//管理が必要な変数などをまとめておく場所
class items {

  //ユーザー情報
  //ユーザー情報は即更新せなあかんくない？とおもうのででいりーーと分けているのだがどう思いますかときく
  static Map<String, dynamic> userInfo = {
    'name':"おさかな",
    'rank':1,
    'points':{
      'now':{
        'erai':0,
        'good':0,
      },
      'total':{
        'totemoerai':0,
        'totemogood':0,
      }
    },
    'stamp':{
      'now':[
        false,false,false,false,false,false,false
      ],
      'totalStampCard':0,
    }
  };

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
    'assets/images/onemu.PNG', //おねむ 5
    'assets/images/stamp.png',  //スタンプ 6
    'assets/images/stampCard.png', //スタンプカード 7
    'assets/images/goodCat.png'  //スタンプカード 8
  ];

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

  //明日のデイリーミッション
  static Map<String, dynamic> nextDayList = {};
}
