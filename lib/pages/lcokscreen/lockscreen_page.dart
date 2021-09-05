//07610459 ภัทราภรณ์ อึ้งเจริญวงค์
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  Widget _buildButton4(int text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        width: 75.0,
        height: 75.0,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black38, width: 3.0),
            /*boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]*/
        ),
      ),
    );
  }

  Widget buttonNumber(int text1,int text2,int text3){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton4(text1),_buildButton4(text2),_buildButton4(text3),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //Alt+Enter คีย์ลัด Wrap with ...
      body: Container(// เทียบเท่า div ในภาษา HTML
        color: Colors.grey.shade100,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 80.0,
                    color: Colors.black38,
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    'กรุณาใส่รหัสผ่าน',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
            buttonNumber(1, 2, 3),
            /*for (var i = 1;i<4;i++)
              _buildButton4('$i'),*/
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1,2,3].map((item) {
                return _buildButton4(item);
              }).toList(),),*/
                buttonNumber(4, 5, 6),
                /*for (var i = 4;i<7;i++)
              _buildButton4('$i'),*/
                buttonNumber(7, 8, 9),
                /*for (var i = 7;i<10;i++)
              _buildButton4('$i'),*/
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                width: 75.0,
                height: 75.0,
                ),
                _buildButton4(0),
                Container(
                width: 75.0,
                height: 75.0,
                child: Icon(
                Icons.backspace_outlined,
                size: 35.0,
                color: Colors.black38,
                ),
                ),
                ],
                ),
                Padding(
                padding : const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'ลืมรหัสผ่าน',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
