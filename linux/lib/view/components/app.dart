import 'package:admirable_to_be_alive_/view/components/pages/page_home.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //デバッグの表示を消す
      home: MyStatefulWidget(), //ホーム画面を呼び出す
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  // アプリケーションの動的なUIの作成と更新？
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class Componentsless {
  static Widget main_box(Widget widget, double _screenSizeWidth,
      {double widthRatio = 0.8,
      double widthRasio = 0.8,
      double paddingHor = 10,
      double paddingVer = 25,
      Color borderColor = Colors.white}) {
    return Container(
      width: _screenSizeWidth * widthRatio,
      padding:
          EdgeInsets.symmetric(horizontal: paddingHor, vertical: paddingVer),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 5,
        ),
        color: Constant.main,
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget,
    );
  }
}



class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageHome(),
    );
  }
}
