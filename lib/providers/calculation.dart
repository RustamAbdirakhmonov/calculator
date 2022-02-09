import 'dart:core';
import 'package:flutter/foundation.dart';
class Calculation extends ChangeNotifier{

     double _result=0.0;

     double get result  => _result;

     set result(result){
       _result=result;
       notifyListeners();
     }

     String _numberString="0";
     String get numberString => _numberString;
     set numberString(numberString){
       _numberString=numberString;
       notifyListeners();
     }

     String _displayString="0";
     String get displayString => _displayString;
     set displayString(displayString){
       _displayString=displayString;
       notifyListeners();
     }

     String _operator ='';
     String get operator => _operator;
     set operator(operator){
       _operator=operator;
       notifyListeners();
     }

     bool _shouldCalculate=false;
     bool get shouldCalculate => _shouldCalculate;
     set shouldCalculate(shouldCalculate){
       _shouldCalculate=shouldCalculate;
       notifyListeners();
     }


    void calculate(){
      switch(_operator){
        case '+':
          _result += double.parse(_numberString) ;
          break;
        case '-':
          _result -= double.parse(_numberString) ;
          break;
        case '*':
          _result *= double.parse(_numberString) ;
          break;
        case '/':
          _result /= double.parse(_numberString) ;
          break;
        default:
          break;
      }
      _numberString=_result.toString();
      _displayString=_numberString;
      notifyListeners();
    }



}