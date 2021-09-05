//07610459 ภัทราภรณ์ อึ้งเจริญวงค์
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GamePage1 extends StatelessWidget {
  const GamePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var num = Random().nextInt(100);
    List<Widget> iconList = [];



    for(var i=0;i<4;i++){
      iconList.add(Icon(Icons.star, size: 18.0, color: Colors.orange,));
    }
    iconList.add(Icon(Icons.star_border_outlined, size: 18.0, color: Colors.orange,));

    var status = true; // false

    List<int> list1 =[
      1,2,3,
      for(var i=1;i<=10;i++)
        i,
      if(status)
        123
    ];

    return Scaffold(
      //Alt+Enter คีย์ลัด Wrap with ...
      appBar: AppBar(
        title: Text('✨GUESS THE NUMBER✨'),
      ),
      body: Container(// เทียบเท่า div ในภาษา HTML
        color: Colors.yellow.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,//ถ้ามี row ไม่จำเป็นต้องมีบรรทัดนี้
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person, // รูปไอคอน
                  size: 80.0, // ขนาดไอคอน
                  color: Colors.pink.shade300, // สีไอคอน
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ภัทราภรณ์ อึ้งเจริญวงค์',
                      //textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Row(
                      children: [
                        //collection-for
                        for(var item in iconList)
                          item,
                        //collection-if
                        if(status)
                          Icon(Icons.star,size: 18.0, color: Colors.blue,)
                      ],
                      //children: iconList



                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  '${Random().nextInt(100)}',
                  style: TextStyle(
                    fontSize: 150.0,
                    color: Colors.purple.shade300,
                    fontWeight: FontWeight.w900,
                  ),
                    textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'RANDOM',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
