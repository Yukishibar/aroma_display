import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //画面の向きを縦に固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //左のアトマイザー設定
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 50.0, right: 10.0, left: 10.0
                  ),
                  child: Text(
                    "Left Atomizer",
                    style: TextStyle(
                      fontSize: 23,
                        fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Arial"
                    ),
                  ),
                ),

                //香りの選択のボタン
                RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                    ),
                    child: Text(
                      "Choose aroma",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                          fontFamily: "Arial"
                      ),
                    ),
                  ),
                  color: Colors.cyan[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    _showModalPicker_Left(context);
                  },
                ),

                //選択した香りを文字として出力する
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                  ),
                  child: Text(
                    _selectedItemLeft,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                        fontFamily: "Arial"
                    ),
                  ),
                ),

                //選択した香りの文字情報をもとにその香りの画像を表示
                _imageItemLeft(_selectedItemLeft),

                //香りを出すボタン
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                  ),
                  child: RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                      ),
                      child: Text(
                        "Aroma output",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                            fontFamily: "Arial"
                        ),
                      ),
                    ),
                    color: Colors.cyan[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),

            //右のアトマイザー設定
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 50.0, right: 10.0, left: 10.0
                  ),
                  child: Text(
                    "Right Atomizer",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Arial"
                    ),
                  ),
                ),

                //香りの選択のボタン
                RaisedButton(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                    ),
                    child: Text(
                      "Choose aroma",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Arial"
                      ),
                    ),
                  ),
                  color: Colors.cyan[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    _showModalPicker_Right(context);
                  },
                ),

                //選択した香りを文字として出力する
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                  ),
                  child: Text(
                    _selectedItemRight,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "Arial"
                    ),
                  ),
                ),

                //選択した香りの文字情報をもとにその香りの画像を表示
                _imageItemRight(_selectedItemRight),

                //香りを出すボタン
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                  ),
                  child: RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 15.0, bottom: 15.0, right: 15.0, left: 15.0
                      ),
                      child: Text(
                        "Aroma output",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Arial"
                        ),
                      ),
                    ),
                    color: Colors.cyan[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showModalPicker_Left(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 40,
              children: _itemsLeft.map(_pickerItemLeft).toList(),
              onSelectedItemChanged: _onSelectedItemChanged_Left,
            ),
          ),
        );
      },
    );
  }

  void _showModalPicker_Right(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 3,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 40,
              children: _itemsRight.map(_pickerItemRight).toList(),
              onSelectedItemChanged: _onSelectedItemChanged_Right,
            ),
          ),
        );
      },
    );
  }

  //香りの種類
  final List<String> _itemsLeft = [
    "lavender",
    "lemon",
    "rosemary",
  ];

  //香りの種類
  final List<String> _itemsRight = [
    "lavender",
    "lemon",
    "rosemary",
  ];

  String _selectedItemLeft = "None";
  String _selectedItemRight = "None";

  //画像のURL処理
  Widget _imageItemLeft(String name) {
    var image = "images/" + name + ".jpg";
    return Container(
      child: Image.asset(image, fit: BoxFit.cover, height: 180, width: 180),
    );
  }

  //画像のURL処理
  Widget _imageItemRight(String name) {
    var image = "images/" + name + ".jpg";
    return Container(
      child: Image.asset(image, fit: BoxFit.cover, height: 180, width: 180),
    );
  }

  //選択ボックスの中
  Widget _pickerItemLeft(String str) {
    return Text(
      str,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
          fontFamily: "Arial"
      ),
        textAlign: TextAlign.center
    );
  }

  //選択ボックスの中
  Widget _pickerItemRight(String str) {
    return Text(
        str,
        style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Arial"
        ),
        textAlign: TextAlign.center
    );
  }

  void _onSelectedItemChanged_Left(int index) {
    setState(() {
      _selectedItemLeft = _itemsLeft[index];
    });
  }

  void _onSelectedItemChanged_Right(int index) {
    setState(() {
      _selectedItemRight = _itemsRight[index];
    });
  }
}


