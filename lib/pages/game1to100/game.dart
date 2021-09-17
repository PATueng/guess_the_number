import 'dart:math';

class Game{
  final int _answer; //มี _ คือเป็น private
  int _totalGuesses ; //int _totalGuesses = 0; จะไม่ต้องกำหนดตรง constructor

  Game() : _answer = Random().nextInt(100)+1, _totalGuesses = 0{
    print('The answer is: $_answer');
  } //constructor

  /*int getTotalGuesses(){
    return _totalGuesses;
  }*/
  //or// fuctional of dart
  int get totalGuesses{
    return _totalGuesses;
  }



  int doGuess(int num){
    _totalGuesses++;
    if(num>_answer) {
      return 1;
    }else if (num<_answer){
      return -1;
    }else{
      return 0;
    }
  }
}