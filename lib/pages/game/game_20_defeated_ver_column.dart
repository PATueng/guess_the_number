import 'package:flutter/material.dart';

class Game20Defeated1 extends StatefulWidget {
  const Game20Defeated1({Key? key}) : super(key: key);

  @override
  _Game20Defeated1State createState() => _Game20Defeated1State();
}

class _Game20Defeated1State extends State<Game20Defeated1> {
  var press = 1; // true /
  bool success = false;
  bool defeated = false;
  var count = 0;

  _setNewGame() {
    setState(() {
      count = 0;
      success = false;
      press = 1; // true
      defeated = false;
    });
  }

  _handleClickButton(int number) {
    setState(() {
      if (count + number < 20) {
        count = count + number;
        if (defeated == false) {
          press = 0; // false
          defeated = true;
        } else {
          press = 1; // true
          defeated = false;
        }
      } else {
        count = 20;
        press = 2; // null
        success = true;
      }
    });
  }

  Widget _buttonNumberBlue(int number) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: press==1 ?() => _handleClickButton(number) : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
          primary: Colors.blue.shade400 ,
        ),
        child: Text(
          '$number',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  Widget _buttonNumberRed(int number) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed:  press == 0 ?() => _handleClickButton(number) : null   ,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
          primary: Colors.red.shade400,
        ),
        child: Text(
          '$number',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              image: const DecorationImage(
                image: const AssetImage("assets/images/bg.jpg"),
                fit: BoxFit
                    .cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buttonNumberRed(3),
                    success ? Container()
                    :Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          for (var item = 0; item < count; item++)
                            Icon(Icons.star, size: 28.0, color: Colors.deepPurpleAccent,),
                          for (var item = 0; item < 20 - count; item++)
                            Icon(Icons.star_border_outlined, size: 28.0, color: Colors.deepPurpleAccent,),
                        ],
                      ),
                    ),
                    _buttonNumberBlue(1),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buttonNumberRed(2),
                    success?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  defeated ?  'BLUE' : 'RED' ,
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: defeated ? Colors.blue.shade400 : Colors.red.shade400,
                                  ),
                                ),
                                Text('WIN !',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black),),
                                OutlinedButton(onPressed: _setNewGame, child: Text('NEW GAME', style: TextStyle(fontSize: 20.0),),)
                              ],
                            ),
                          ],
                        )
                    :Column(
                      children: [
                        Icon(Icons.keyboard_arrow_up, size: 100.0, color: press == 0 ? Colors.black : Colors.black12,),
                        Text('$count', style: TextStyle(fontSize: 120.0,),),
                        Icon(Icons.keyboard_arrow_down, size: 100.0, color: press == 1 ? Colors.black : Colors.black12,),
                      ],
                    ),
                    _buttonNumberBlue(2),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buttonNumberRed(1),
                    _buttonNumberBlue(3),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
