import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game;
  //กำหนดแบบนี้ Game? _game; หรือต้องกำหนดค่าให้ตัวแปร หรือกำหนดเป็น late Game game; คือจะไปกำหนดค่าภายหลังโดยที่ไม่ null
  final TextEditingController _controller = TextEditingController();
  String? _guessNumber; //ครอบด้วย setstate ตอนเริ่มเกมใหม่
  String? _feedback;
  bool win = false;
  var listNumber = [];
  @override
  void initState() {
    //ทำตอนสร้างครั้งแรก
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    //ทำตอนลบทิ้ง
    _controller.dispose();
    super.dispose();
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  newGame(){
    setState(() {
      _game = Game();
      //final TextEditingController _controller = TextEditingController();
      _guessNumber = null; //ครอบด้วย setstate ตอนเริ่มเกมใหม่
      _feedback = null;
      win = false;
      _controller.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade200,
        //กำหนดสีห้ามกำหนดพื้นหลัง กำหนดพื้นหลังห้ามกำหนดสี
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240.0, // 160 = 1 inch
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.kanit(fontSize: 22.0),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? /*SizedBox.shrink()*/
    Column(
      children:[
        Text('Number Between\n① ⒶⓃⒹ ①⓪⓪\nCan you guess it?😁',textAlign: TextAlign.center,style: GoogleFonts.kanit(fontSize: 25.0),),
      ]
    )
        : Column(
            children: [
              Text(_guessNumber!,style: GoogleFonts.kanit(fontSize: 80.0),),
              Text(_feedback!,style: GoogleFonts.kanit(fontSize: 50.0),),
              win == true ?
                ElevatedButton(onPressed: newGame, child: Text('New Game'))
              : SizedBox.shrink(),

            ],
          );
  }

  Widget _buildInputPanel() {
    return Card(
      color: Colors.pink.shade100,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.blue,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  isDense: true,
                  // กำหนดลักษณะเส้น border ของ TextField ในสถานะปกติ
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  // กำหนดลักษณะเส้น border ของ TextField เมื่อได้รับโฟกัส
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Enter the number here',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _guessNumber = _controller.text;
                  int? guess = int.tryParse(_guessNumber!);
                  if (guess != null) {
                    listNumber.add(guess);
                    var result = _game.doGuess(guess);
                    if (result == 0) {
                      //ทายถูก
                      _feedback = 'CORRECT';
                      win = true;
                      _showMaterialDialog('Good Job!', 'The answer is $guess \nYou have made ${listNumber.length} guesses.\n\n ${listNumber.join(" -> ")}');
                    } else if (result == 1) {
                      //ทายมากไป
                      _feedback = 'TOO HIGH!';
                    } else {
                      //ทายน้อยไป
                      _feedback = 'TOO LOW!';
                    }
                  }
                });
                _controller.clear();
              },
              child: Text('GUESS'),
            ),
          ],
        ),
      ),
    );
  }
  
}
