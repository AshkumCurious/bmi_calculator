import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'calculation.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiresult,@required this.text,@required this.interpretation});

  final String bmiresult;
  final String text;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('BMI CALCULATOR'),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(15.0),
            child: Text('Your Result',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
        Expanded(
          flex: 5,
          child: ReUsableCard(colour: Colors.black45,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.greenAccent,
              ),),
              Text(bmiresult,
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),),
              Text(interpretation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                  fontSize: 20,

                ),),
            ],
          ),
          ),
        ),
        BottomButton(buttonTitle: 'RE-CALCULATE', onTap: () {
    Navigator.pop(context);
    })
      ],
    )
    );
  }
}
