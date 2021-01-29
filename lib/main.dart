import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

void main() async{
  Socket sock = await Socket.connect('secret', 80);
  runApp(MyApp(sock));
}

class MyApp extends StatelessWidget {
  Socket socket;

  MyApp(Socket s) {
    this.socket = s;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        channel: socket,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Socket channel;

  MyHomePage({Key key, this.title, this.channel}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _displayCon() {
    widget.channel.write("j\n");
  }

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "FeelEng-lab",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              //fontFamily: "Lobster",
              fontFamily: "PaytoneOne", //not blodならあり
              fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: Colors.indigo[600],
      ),
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
                    "Left",
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
                  color: Colors.indigo[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    _showModalPicker_left(context);
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
                    color: Colors.indigo[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: _displayCon,
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
                    "Right",
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
                  color: Colors.indigo[400],
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
                    color: Colors.indigo[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: _displayCon,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showModalPicker_left(BuildContext context) {
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

  String _selectedItemLeft = "lavender";
  String _selectedItemRight = "lemon";

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
