import 'package:flutter/material.dart';

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

  //今日のデイリーミッション
  static List todayDailyList = [];

  //明日のデイリーミッション
  static List nextdayDailyList = [];
}
