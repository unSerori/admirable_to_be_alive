import 'package:flutter/material.dart';
import '../constant.dart';
// import '../app.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>{
  //好感度ランク
  static int rank = 0;
  

  @override
  Widget build(BuildContext context){
    //画面サイズ
    var _screenSizeWidth = MediaQuery.of(context).size.width; 

    return Scaffold(
      body: Center(
        //ページの中身
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(40),
          decoration: const BoxDecoration(color: Constant.white),
          child: Column(
            children: [
              Row(
                children: [

                  ////好感度ランクの表示
                  Container(
                    // child Widgetの位置を中央に指定
                    alignment: const Alignment(0.0, 0.0),
                    width: _screenSizeWidth * 0.18,
                    height: _screenSizeWidth * 0.18,
                    decoration: BoxDecoration(
                      color: Constant.main,
                      borderRadius: BorderRadius.circular(10),  //角丸
                    ),
                    child:CustomText(color: Constant.white,text: rank.toString(),fontSize: _screenSizeWidth * 0.10,), 
                  )
                ],

              )
            ],

          ),
          )
        ),       
    );
  }
}
