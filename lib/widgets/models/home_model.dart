import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  var text1 = 'Text1';
  var text2 = 'Text2';
  var text3 = 'Text3';
  var text4 = 'Text4';
  var text5 = 'Text5';
  var text6 = 'Text6';
  var host = 'http://127.0.0.1:8888';

  void changeText(int num, String val) {
    switch (num) {
      case 1:
        text1 = val;
        break;
      case 2:
        text2 = val;
        break;
      case 3:
        text3 = val;
        break;
      case 4:
        text4 = val;
        break;
      case 5:
        text5 = val;
        break;
      case 6:
        text6 = val;
        break;
      case 7:
        host = val;
        break;
    }
    notifyListeners();
  }

}