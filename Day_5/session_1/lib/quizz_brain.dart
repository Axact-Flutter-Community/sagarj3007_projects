import 'question.dart';

class QuizBrain{
  int _qno=0;
  List<Question> _qbank=[
    Question('An octopus has five hearts', false),
    Question('A metre is further than a yard', true),
    Question('Flying in an aeroplane is statistically safer than driving in a car', true),
    Question('Napoleon was of below-average height', false),
  ];

  void nextQuestion(){
    if(_qno < _qbank.length - 1){
      _qno++;
    }
  }

  String getQuestion(){
    return _qbank[_qno].questionText;
  }

  bool getAns(){
    return _qbank[_qno].ans;
  }

  bool isDone(){
    if(_qno >= _qbank.length-1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _qno = 0;
  }
}