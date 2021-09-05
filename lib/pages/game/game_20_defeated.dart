import 'package:flutter/material.dart';

class Game20Defeated extends StatefulWidget {
  const Game20Defeated({Key? key}) : super(key: key);

  @override
  _Game20DefeatedState createState() => _Game20DefeatedState();
}

class _Game20DefeatedState extends State<Game20Defeated> {
  var press = 1; // true //ไว้สำหรับเงื่อนไขในการทำงานของปุ่มสีฟ้าและสีแดง และเงื่อนไขของสีลูกศร
  bool success = false; // สำหรับการแสดงดาวและตัวเลข หรือ ข้อความกับปุ่มนิวเกม
  bool defeated = false; // สำหรับควบคุมการแสดงข้อความ red win or blue win
  var count = 0; //ตัวแปรสำหรับรวมเลขตามปุ่มที่กด

  _setNewGame() { //ใช้ตอนกดปุ่ม New Game เป็นการตั้งค่าตัวแปรให้เป็นเหมือนตอนแรก(ตามข้างบน)
    setState(() {  //เมธอดในการทำงานของ button ต่างๆ
      count = 0;
      success = false;
      press = 1; // true
      defeated = false;
    });
  }

  _handleClickButton(int number) { //ใช้สำหรับ widget _buttonNumberRed กับ _buttonNumberBlue
    setState(() {
      if (count + number < 20) {
        count = count + number;
        if (defeated == false) {
          press = 0; // false // ปุ่มสีแดง ทำงาน
          defeated = true; // ข้อความแสดง Blue Win
        } else {
          press = 1; // true // ปุ่มสีน้ำเงิน ทำงาน
          defeated = false; // ข้อความแสดง Red Win
        }
      } else {
        count = 20;
        press = 2; // null //ตั้งเป็น 2 เพราะจะทำให้ทั้งปุ่มสีแดงและน้ำเงินไม่ทำงาน
        success = true; //จะแสดงก้อนของข้อความ win และปุ่ม new game
      }
    });
  }

  Widget _buttonNumberBlue(int number) { //เมธอดสำหรับปุ่มสีน้ำเงิน
    return Padding(
      padding: const EdgeInsets.all(10.0), //ระยะห่างของปุ่มแต่ละอันจากด้านบนล่างซ้ายขวา
      child: ElevatedButton(
        onPressed: press==1 ?() => _handleClickButton(number) : null, //ถ้า press = 1 จริงให้เรียกใช้่เมธอด _handle ถ้าไม่จริงให้ปุ่มเป็น null ไป (ก็คือปุ่มไม่ทำงาน)
        style: ElevatedButton.styleFrom( //ใช้ตกแต่งปุ่ม
          padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 4.0), //ขนาดของพื้นที่กรอบสี่เหลี่ยม
          primary: Colors.blue.shade400 , //สี
        ),
        child: Text(
          '$number', //กำหนดตัวเลขในปุ่ม
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  Widget _buttonNumberRed(int number) { //เมธอดสำหรับปุ่มสีน้ำเงิน
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed:  press == 0 ?() => _handleClickButton(number) : null   , //เหมือน _buttonNumberBlue เลยแค่เปลี่ยนว่าจะทำงานเมื่อ press = 0
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 4.0),
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
      body: SafeArea( //ทำให้ไม่แสดงในแถบด้านบนสุด
        child: Container( //กำหนดพื้นหลัง
            decoration: const BoxDecoration(
              image: const DecorationImage(
                image: const AssetImage("assets/images/bg.jpg"),
                fit: BoxFit
                    .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
              ),
            ),
            child: Container( //ไม่ต้องมีก็ได้ ลบทิ้งได้ (alt+enter->remove this widget)
              child: Column( //มองหน้าจอของเราเป็นคอลัมน์
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //กำหนดว่าต่อไปนี้แนวตั้งให้แต่ละ children ระยะห่างเท่ากัน
                children: [
                  Row( // มองปุ่ม 3 ปุ่ม ว่ามันเรียงเป็นแนวนอนเป็นแถว
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,// ให้ระยะห่างของปุ่มเว้นเท่าๆกัน
                    //children: [3,2,1].map((e) => _buttonNumberRed(e)).toList(),
                      /*children:[
                      _buttonNumberRed(3),
                      _buttonNumberRed(2),
                      _buttonNumberRed(1),
                    ],*/
                    children: [ //เป็นลูปส่งตัวเลขที่จะแสดงในปุ่ม
                      for(int i=3;i>=1;i--)
                        _buttonNumberRed(i)
                    ],
                  ),
                  success //ไว้เลือกว่าจะแสดงดาวและตัวเลข หรือ ข้อความกับปุ่มนิวเกม
                      ? Column( //ถ้า success เป็นจริง ให้แสดงคอลัมน์นี้
                          children: [
                            Text( //จะแสดงข้อความจริงใช้ Text
                              defeated ?  'BLUE' : 'RED' , // ถ้า defeated จริง แสดง blue เท็จ แสดง red
                              style: TextStyle( //ตกแต่งข้อความ
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: defeated ? Colors.blue.shade400 : Colors.red.shade400,//ลูกเล่นเปลี่ยนสีข้อความตามสีที่ชนะ
                              ),
                            ),
                            Text('WIN !',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.black),),
                            OutlinedButton(onPressed: _setNewGame, child: Text('NEW GAME', style: TextStyle(fontSize: 20.0),),)
                            //ปุ่ม new game onPress เรียกเมธอด _setNewGame เพื่อรีเซตค่าทั้งหมดให้เป็นค่าเริ่มต้น
                          ],
                        )
                      : Padding( //ถ้า success เป็นเท็จ ให้แสดงแถวนี้
                        padding: const EdgeInsets.all(10.0), //ให้ระยะห่างรอบด้านเท่ากับ 10
                        child: Row( //มองดาวและตัวเลขกับลูกศรว่าให้เป็นอีก 1 แถวถัดจาก ปุ่มสีแดง
                          children: [
                            Column( //คอมลัมน์ของดาว เพราะดาวเป็นแนวตั้งจึงเป็นคอลัมน์
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var item = 0; item < count; item++) //ให้แสดงดาวทึบตามจำนวน count
                                  Icon(Icons.star, size: 28.0, color: Colors.deepPurpleAccent,),
                                for (var item = 0; item < 20 - count; item++) //ให้แสดงดาวโปร่งตามจำนวน 20-count
                                  Icon(Icons.star_border_outlined, size: 28.0, color: Colors.deepPurpleAccent,)
                              ],
                            ),
                            Expanded( //ใช้เพื่อให้ยืดตัวเลขและลูกศรให้อยู่กลางจอ
                              child: Column( //มองลูกศรตัวเลขลูกศรเป็นคอลัมน์ เพราะเรียงเป็นแนวตั้ง
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.keyboard_arrow_up, size: 100.0, color: press == 0 ? Colors.black : Colors.black12,),
                                  //ใช้ press คุมเรื่องสี สีแดง press เท่ากับ 0 ถ้าปุ่มสีแดงทำงานลูกศรจะเป็นสีดำ ถ้าสีน้ำเงินทำงานลูกศรจะเป็นสีเทา
                                  Text('$count', style: TextStyle(fontSize: 120.0,),),
                                  Icon(Icons.keyboard_arrow_down, size: 100.0, color: press == 1 ? Colors.black : Colors.black12,),
                                  //ใช้ press คุมเรื่องสี สีน้ำเงิน press เท่ากับ 1 ถ้าปุ่มสีน้ำเงินทำงานลูกศรจะเป็นสีดำ ถ้าสีน้ำแดงทำงานลูกศรจะเป็นสีเทา
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  Row( //มองปุ่มเป็นแนวนอนตามแถว ถัดจากแถวของดาว
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    /*children: [
                      _buttonNumberBlue(1),
                      _buttonNumberBlue(2),
                      _buttonNumberBlue(3),
                    ],*/
                    children: [
                      for(int i=1;i<=3;i++)
                        _buttonNumberBlue(i)
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
