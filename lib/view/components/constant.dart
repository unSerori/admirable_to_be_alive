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
  static Widget MainBox2(Widget widget, double scleenwidth ,double scleenheight,double width, double height,
      {Color bordColor = Constant.main}) {
    return Container(
      width: scleenwidth * width,
      height: scleenheight * height,
      alignment: const Alignment(0.0, 0.0), //文字を真ん中にする
      decoration: BoxDecoration(
        color: bordColor,
        borderRadius: BorderRadius.circular(10), //角丸
      ),
      child: Container(
        alignment: const Alignment(0.0, 0.0),
          width: scleenwidth * (width -0.05),
          height: scleenheight * (height -0.025),
          decoration: BoxDecoration(
            color: bordColor,
            borderRadius: BorderRadius.circular(10), //角丸
            border: Border.all(
              color: Constant.white,
              width: 2,
            ),
          ),
          child: widget
        )
    );
  }
}


