import 'package:flutter/material.dart';
import '../constant.dart';

class PageSetting extends StatefulWidget {
  const PageSetting({Key? key}) : super(key: key);

  @override
  _PageSetting createState() => _PageSetting();
}

class _PageSetting extends State<PageSetting> {
  
  @override
  Widget build(BuildContext context) {
    //画面サイズ
    var _screenSizeWidth = MediaQuery.of(context).size.width;
    var _screenSizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(body: Center(
      child: Container(
        width: _screenSizeWidth,
        height: _screenSizeHeight,
        padding: EdgeInsets.all(_screenSizeWidth * 0.01),
        decoration: const BoxDecoration(color: Constant.main),
        alignment: Alignment(0.0, 0.0),

      ),
    
    ));
  }
}
