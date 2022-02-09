import 'package:calculator/providers/calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Buttons extends StatefulWidget {
  String buttonItem;
  Color color;
  Buttons(this.buttonItem,this.color, {Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {

  void pressButton(String title,BuildContext context){
    String numberString= Provider.of<Calculation>(context).numberString;
    bool shouldCalculate=Provider.of<Calculation>(context).shouldCalculate;

    if (title == "+" || title == "-" || title == "x" || title == "/") {
      if (shouldCalculate) {
        Provider.of<Calculation>(context).calculate();
      } else {
        Provider.of<Calculation>(context).result =
            double.parse(numberString) ;
        Provider.of<Calculation>(context).shouldCalculate = true;
      }

      Provider.of<Calculation>(context).numberString = '';
      Provider.of<Calculation>(context).operator = title;
    } else if (title == '=') {
      Provider.of<Calculation
      >(context).calculate();
      Provider.of<Calculation>(context).shouldCalculate = false;
    } else if (title == 'AC') {
      Provider.of<Calculation>(context).numberString = '';
      Provider.of<Calculation>(context).displayString = '0';
      Provider.of<Calculation>(context).shouldCalculate = false;
    } else {
      if (numberString == '0' || numberString == '0.0') {
        Provider.of<Calculation>(context).numberString = '';
      }
      Provider.of<Calculation>(context).numberString += title;
      Provider.of<Calculation>(context).displayString = numberString;
    }

  }
  @override
  Widget build(BuildContext context) {
    final  height= MediaQuery.of(context).size*0.22;
    return ElevatedButton(onPressed: (){
        pressButton(widget.buttonItem, context);
    }, child: Text(widget.buttonItem,style: const TextStyle(fontSize: 26),),
     style: ElevatedButton.styleFrom(
       elevation: 0,
       fixedSize:  Size(height.width,height.width),
       shape: const CircleBorder(),
       primary: widget.color,
     ),
    );

  }
}
