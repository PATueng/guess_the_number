import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OlympicPage extends StatefulWidget {
  const OlympicPage({Key? key}) : super(key: key);

  @override
  _OlympicPageState createState() => _OlympicPageState();
}

class _OlympicPageState extends State<OlympicPage> {
  int count = 0;
  bool red = false;
  bool blue = false;
  bool press = true;
  int nine = 9;
  int ten = 10;

  _handleClickButton(int number){
    setState(() {
      count = count + 1;
      //press = !press;
      if (number == 1){
        red = !red;
      }else if(number == 2){
        blue = !blue;
      }
    }
    );
  }
  Widget _buttonNumberRed(int number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed:  press==true ?() => _handleClickButton(number) : _handleClickButton(0)  ,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(),
            primary: Color(0xFFA00000),
          ),
          child: Icon(Icons.person, size: 30.0,color: Colors.white,)
        ),
      ),
    );
  }

  Widget _buttonNumberBlue(int number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed:  press==true ?() => _handleClickButton(number) : _handleClickButton(0),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(),
              primary: Color(0xFF0000A0) ,
            ),
            child: Icon(Icons.person, size: 30.0,color: Colors.white,)
        ),
      ),
    );
  }

  Widget score(){
    return(
        Container(
          width: 50,
          child: Row(
            children: [
              red==true ? Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' ROUND $count\n\n', style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('$ten        ', style: TextStyle(fontSize: 25.0),textAlign: TextAlign.left,),
                      Text('$nine', style: TextStyle(fontSize: 25.0),textAlign:TextAlign.right),
                    ],
                  ),
                ],
              ):SizedBox.shrink(),
              blue ==true ?Row(
                children: [
                  Row(
                    children: [
                      Text('ROUND $count\n\n', style: TextStyle(fontSize: 25.0),textAlign: TextAlign.center,),
                    ],
                  ),
                  Row(
                    children: [
                      Text('$nine      ', style: TextStyle(fontSize: 25.0),textAlign: TextAlign.left,),
                      Text('$ten', style: TextStyle(fontSize: 25.0),textAlign: TextAlign.right,),
                    ],
                  ),
                ],
              ):SizedBox.shrink(),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLYMPIC BOXING SCORING'),
        backgroundColor: Colors.red,
      ),
      body:  Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  child : Image(
                     image : AssetImage("assets/images/logo.png"),
                      fit: BoxFit.scaleDown,
                  )
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  height: 30,
                  color: Colors.black,
                  child: Text(
                    'Women\'s Light (57-60) Semi-Final',
                        style: TextStyle(
                          color : Colors.white,
                          fontSize: 20.0
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [Icon(Icons.person, size: 80.0,color: Color(0xFFA00000),),],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 30, height: 25,
                      child: Image(
                        image: AssetImage("assets/images/flag_ireland.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                      Text('  IRELAND', style: TextStyle(fontSize: 22.0),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('HARRINGTON Kelling Anne', style: TextStyle(fontSize: 18.0),),
                    ],
                  ),
                ],
              ),
            ],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [Icon(Icons.person, size: 80.0,color: Color(0xFF0000A0),),],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 30, height: 25,
                      child: Image(
                        image: AssetImage("assets/images/flag_thailand.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                      Text('  THAILAND', style: TextStyle(fontSize: 22.0),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('SEESONDEE Sudaporn', style: TextStyle(fontSize: 18.0),),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded
                (child: Container(height: 5, color: Color(0xFFA00000),),),
              Expanded
                (child: Container(height: 5, color: Color(0xFF0000A0),),)
            ],
          ),
           Expanded(
            child:/* press == true?*/ Row(
              children: [
                score(),
              ],
            ) /*:SizedBox.shrink()*/,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             _buttonNumberRed(1), _buttonNumberBlue(2),
            ],
          ),
        ],
      ),
      );

  }
}
