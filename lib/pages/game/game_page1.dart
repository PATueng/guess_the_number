//07610459 ภัทราภรณ์ อึ้งเจริญวงค์
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var list = [1, 2, 3];
  bool showNumber = true;

  _handleClickButton() {
    setState(() {
      //i=i+1; //i++
      list.add(list.length + 1);
    });
  }

  _handleClickButton2() {
    setState(() {
      showNumber = !showNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: list
                              .map(
                                (e) => Text(
                                  e.toString(),
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              )
                              .toList(),
                        )
                       // list.map((e) => Text(
                  /*Text(
                    i.toString(),
                    style: TextStyle(fontSize: 30.0),
                  ),*/
                  /*for (var i =0 ;i<list.length;i++) //for(var item in list
                     Text(i.toString(), style: TextStyle(fontSize: 30.0)),*/
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _handleClickButton,
                    child: Text('TEST'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                    onPressed: _handleClickButton2,
                    child: Text('TEST2'),
                  ),
                ],
              ),
              Image(image: AssetImage(
                showNumber ? 'assets/images/cat.png' : 'assets/images/op.png' ,
              ),
              width: 100,
              //height: 75,
              fit: BoxFit.contain,),
            ],
          ),
        ),
      ),
    );
  }
}
