import 'package:calculator/providers/calculation.dart';
import 'package:calculator/widgets/buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainCalculatorScreen extends StatefulWidget {

  @override
  _MainCalculatorScreenState createState() => _MainCalculatorScreenState();
}

class _MainCalculatorScreenState extends State<MainCalculatorScreen> {
  Color colour1 = Colors.amber;
  Color colour2 = Colors.orange;
  Color colour3 = Colors.grey;
  Color backgroundColor = Colors.white;
  Color iconColor = Colors.black;
  bool isDark = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    final height = MediaQuery.of(context).size.width * 0.2;
     String displayedValue=Provider.of<Calculation>(context,listen: false).displayString;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                  if (isDark) {
                    colour1 = Colors.grey;
                    colour3 = Colors.blueGrey;
                    backgroundColor = Colors.black;
                    iconColor = Colors.white;
                  } else {
                    iconColor = Colors.black;
                    colour1 = Colors.amber;
                    colour3 = Colors.grey;
                    backgroundColor = Colors.white;
                  }
                });
              },
              icon: isDark
                  ? const Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.black,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: backgroundColor),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                alignment: Alignment.bottomRight,
                height: 120,
                child:   Text(displayedValue),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Buttons('AC', colour1),
                  Buttons('+/-', colour1),
                  Buttons('%', colour1),
                  Buttons('/', colour2),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Buttons('7', colour3),
                  Buttons('8', colour3),
                  Buttons('9', colour3),
                  Buttons('х', colour2),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Buttons('4', colour3),
                  Buttons('5', colour3),
                  Buttons('6', colour3),
                  Buttons('-', colour2),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Buttons('1', colour3),
                  Buttons('2', colour3),
                  Buttons('3', colour3),
                  Buttons('+', colour2),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('0',style: const TextStyle(fontSize: 18),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(width, height),
                        padding: EdgeInsets.all(5),
                        primary: colour3,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                  Buttons(',', colour3),
                  Buttons('=', colour2),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
