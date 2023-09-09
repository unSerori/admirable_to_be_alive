import 'package:flutter/material.dart';
import 'constant.dart';

//管理が必要な変数などをまとめておく場所
class items {
  //えらいいねとすごいいね
  static int erai = 10;
  static int good = 80;

  //交換に必要なもの
  static List money = ['images/gezi.png', 'images/usagi.png'];

  //交換所の中身
  static List itemList = [
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
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
        'images/usagi.png',
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

  //これでつくるとあとで困りそうなんですけれどひとまず ひとまず、、、、
  //今日のデイリーミッション
  static List todayList = [
    //内容
    ['あさごはんたべる', 'おうちでる', 'でんしゃのる', 'おひるごはんちょうたつ', 'じゅぎょうでねない', 'おうちかえる'],
    //報酬P
    [20, 50, 40, 20, 40, 10],
    //達成の有無
    [false, false, false, false, false, false],
    //色
    [
      Constant.white,
      Constant.white,
      Constant.white,
      Constant.white,
      Constant.white,
      Constant.white,
    ]
  ];

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
  // ignore: non_constant_identifier_names
  static var Achievement = todayList[2].where((element) => element == true).length / todayList[0].length * 100;
}
