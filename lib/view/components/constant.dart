import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static const Color main = Color(0xFF82E2E4);
  static const Color sub1 = Color(0xFFFF9F9F);
  static const Color sub2 = Color(0xFFD7FF37);
  static const Color sub3 = Color(0xFFFFDC61);
  static const Color glay = Color(0xFFD9D9D9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF3E3E3E);
}

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      softWrap: true, // 自動改行
      overflow: TextOverflow.ellipsis, // テキストが領域からはみ出た場合の動作を指定
      maxLines: 2, // 改行後の最大行数
      style: GoogleFonts.kosugiMaru(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

//枠線付きボックス
class MainBox {
  static Widget MainBox2(Widget widget, double scleenwidth, double scleenheight, double width, double height,
      {Color bordColor = Constant.main, Color boederColor = Constant.white, double borderWidth = 2}) {
    //外側の箱
    return Container(
        width: scleenwidth * width,
        height: scleenheight * height,
        alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
        decoration: BoxDecoration(
          color: bordColor,
          borderRadius: BorderRadius.circular(10), //角丸
        ),
        //中身の箱
        child: Container(
            alignment: const Alignment(0.0, 0.0),
            width: scleenwidth * (width - 0.05),
            height: scleenheight * (height - 0.025),
            decoration: BoxDecoration(
              color: bordColor,
              borderRadius: BorderRadius.circular(10), //角丸
              border: Border.all(
                color: boederColor,
                width: borderWidth,
              ),
            ),
            child: widget));
  }
}

/*

//背景
class HorizontalScrollingBackground extends StatefulWidget {
  @override
  _HorizontalScrollingBackgroundState createState() => _HorizontalScrollingBackgroundState();
}

class _HorizontalScrollingBackgroundState extends State<HorizontalScrollingBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();

    // アニメーションコントローラーを初期化
    _controller = AnimationController(
      duration: Duration(seconds: 15), // アニメーションの期間
      vsync: this,
    )..repeat(); // アニメーションを繰り返す

    // Tweenを使ってアニメーションの開始値と終了値を設定
    Tween<Offset> _tween = Tween<Offset>(
      begin: Offset(0, 0), // 開始位置
      end: Offset(1, -1), // 終了位置 (斜め上方向に移動)
    );

    // アニメーションを設定
    _animation = _tween.animate(_controller)
      ..addListener(() {
        setState(() {}); // ウィジェットを再描画
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // アニメーションコントローラーを破棄
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 画面サイズを取得
    screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight,
      color: Colors.white.withOpacity(0), // 背景色
      child: Stack(
        children: [
          // 背景画像
          AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                left: _animation.value.dx * screenWidth, // 水平方向の位置
                top: _animation.value.dy * screenHeight, // 垂直方向の位置
                child: Image.asset(
                  'images/haikei.png', // 画像のパスを指定
                  width: screenWidth, // 画面幅に合わせて画像を表示
                  height: screenHeight,
                  fit: BoxFit.cover, // 画像を画面に合わせて表示
                ),
              );
            },
          ),
          // その他のウィジェットをここに追加
        ],
      ),
    );
  }
}
*/
