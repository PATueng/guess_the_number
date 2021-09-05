import 'package:flutter/material.dart';

class Game20Lose extends StatefulWidget {
  const Game20Lose({Key? key}) : super(key: key);

  @override
  _Game20LoseState createState() => _Game20LoseState();
}

class _Game20LoseState extends State<Game20Lose> {
  bool press = true;
  bool success = false;
  bool defeated = true;
  var count = 0;

  _setNewGame(){
    setState(() {
      count=0;
      success = false;
      press = true;
      defeated = true;
    });
  }

  _handleClickButton1() {
    setState(() {
      if(count>20)
        _setNewGame();
      else
        count=count+1;
      press =!press;
      defeated = !defeated;
      if(count==20) {
        success = true;
      }
    });
  }
  _handleClickButton2() {
    setState(() {
      if(count>20)
        _setNewGame();
      else
        count=count+2;
      press = !press;
      defeated = !defeated;
      if(count==20) {
        success = true;
      }
    });
  }
  _handleClickButton3() {
    setState(() {
      if(count>20)
        _setNewGame();
      else
        count=count+3;
      press = !press;
      defeated = !defeated;
      if(count==20) {
        success = true;
      }
    });
  }
  Widget _buttonNumber1(int num){
    if(num==1) {
      if(count==20) {
        press = false;
      }
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: press ? _handleClickButton1 : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            primary: press ? Colors.blue.shade400 : Colors.grey.shade400,
          ),
          child: Text(
            '1',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      );
    }
    else{
      if(count==20) {
        press = true;
      }
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: press ?  null:_handleClickButton1 ,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            primary: press ?  Colors.grey.shade400 :Colors.red.shade400 ,
          ),
          child: Text(
            '1',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      );
    }
  }

  Widget _buttonNumber2(int num){
    if(num==1) {
      if(count==20) {
        press = false;
      }
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: press ? _handleClickButton2 : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            primary: press ? Colors.blue.shade400 : Colors.grey.shade400,
          ),
          child: Text(
            '2',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      );
    }
    else{
      if(count==20) {
        press = true;
      }
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: press ? null : _handleClickButton2 ,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            primary: press ? Colors.grey.shade400: Colors.red.shade400  ,
          ),
          child: Text(
            '2',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      );
    }
  }

  Widget _buttonNumber3(int num){
    if(num==1) {
      if(count==20) {
        press = false;
      }
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: press ? _handleClickButton3 : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            primary: press ? Colors.blue.shade400 : Colors.grey.shade400,
          ),
          child: Text(
            '3',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      );
    }
    else{
      if(count==20) {
        press = true;
      }
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: press ?  null: _handleClickButton3 ,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            primary: press ? Colors.grey.shade400 : Colors.red.shade400  ,
          ),
          child: Text(
            '3',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
            ),
          ),
          child: SafeArea( // ไม่ให้ layout ไปอยู่ตรงส่วน status bar หรือ notch
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buttonNumber3(2),
                      _buttonNumber2(2),
                      _buttonNumber1(2),
                    ],
                  ),
                  success ?
                  Column(
                    children: [
                      Text(
                        defeated ? 'BLUE WIN': 'RED WIN'  ,
                        style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.amber,),
                        textAlign: TextAlign.center,
                      ),
                      OutlinedButton(
                        onPressed: _setNewGame,
                        child: Text(
                          'NEW GAME',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ],
                  ) : Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for(var item=0;item<count;item++)
                               Icon(Icons.star,size: 28.0, color: Colors.deepPurpleAccent,),
                              for(var item=0;item<20-count;item++)
                               Icon(Icons.star_border_outlined,size: 28.0, color: Colors.deepPurpleAccent,)
                            ],
                          ),
                        ),
                         Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               press ? Icon(Icons.keyboard_arrow_up,size: 100.0, color: Colors.grey,)
                                   :Icon(Icons.keyboard_arrow_up,size: 100.0, color: Colors.black,),
                               Text(
                                 count.toString(),
                                 style: TextStyle(fontSize: 120.0),
                               ),
                               press ? Icon(Icons.keyboard_arrow_down,size: 100.0, color: Colors.black,)
                               :Icon(Icons.keyboard_arrow_down,size: 100.0, color: Colors.grey,),
                             ],
                           ),
                         )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buttonNumber1(1),
                      _buttonNumber2(1),
                      _buttonNumber3(1),
                    ],
                  ),
                ],
              ),
            ), // Your widget tree
          )
      ),
    );
  }
}
