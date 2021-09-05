import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game20Lose2 extends StatefulWidget {
  const Game20Lose2({Key? key}) : super(key: key);

  @override
  _GamepageState2 createState() => _GamepageState2();
}


class _GamepageState2 extends State<Game20Lose2> {

  int turn = 1;
  int count = 0;
  int color = 1;
  double mediumSize = 100.0;
  double winTextSize = 80.0;
  double mediumSizeText = 150.0;

  List<Widget> scoreCounter = [];

  _swipeTurn(int point){
    setState((){

      if(count + point < 20){
        count += point;
        //print("$turn");
        if(color == 1){
          turn = 2;
          color = 2;
        }else{
          turn = 1;
          color = 1;
        }
      }else{
        count = 20;
        turn = 3;
      }

    });
  }

  _newGame(){
    setState(() {
      count = 0;
      turn = 1;
      color = 1;
    });
  }
  Widget _buildButtonBlue(int i){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: turn == 1 ?() => _swipeTurn(i) : null,
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0)
        ),
        child: Text(
          i.toString(),
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }

  Widget _buildButtonRed(int i){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: turn == 2 ?() => _swipeTurn(i) : null,
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0)
        ),
        child: Text(
          i.toString(),
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [3,2,1].map((e) => _buildButtonRed(e)).toList(),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for(int i = 1;i <= 20 && count < 20; ++i)
                              if(i <= count)
                                Icon(Icons.star_outlined, size: 23.0,color: Colors.purple,)
                              else
                                Icon(Icons.star_border, size: 23.0,color: Colors.purple)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(count < 20)
                              Column(
                                children: [
                                  Icon(Icons.keyboard_arrow_up, size: mediumSize,color: turn == 2 ? Colors.black : Colors.black.withAlpha(40),),
                                  Text("$count", style: TextStyle(fontSize: mediumSizeText),),
                                  Icon(Icons.keyboard_arrow_down, size: mediumSize,color: turn == 1 ? Colors.black : Colors.black.withAlpha(40),),
                                ],
                              )
                            else
                              Column(
                                children: [
                                  Text(color == 1 ? "Red\nwin!" : "Blue\nwin!" , style: TextStyle(fontSize: winTextSize, fontWeight: FontWeight.bold),),
                                  OutlinedButton(
                                    onPressed: _newGame,
                                    child: Text(
                                      'NEW GAME',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  )

                                ],
                              )
                          ]
                          ,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1,2,3].map((e) => _buildButtonBlue(e)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
