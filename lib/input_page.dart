import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'bottom_button.dart';
import 'calculation.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = Colors.black45;
  Color femaleCardColor = Colors.black45;
  Gender gender;
  int height=180;
  int weight=60;
  int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReUsableCard(
                onPress: () {
                  setState( () {
                    gender = Gender.male;
                    });
                },
                colour: gender == Gender.male? Colors.black26 : Colors.black45,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              ),),
              Expanded(child: ReUsableCard(
                  onPress: () {
                    setState( () {
                      gender = Gender.female ;
                    });
                  },
                colour: gender == Gender.female? Colors.black26 : Colors.black45,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  )
              ),
              ),
            ],
          ),),
          Expanded(child: ReUsableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kTextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style: kNumberstyle,
                    ),
                    Text('cm',
                    style: kTextstyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x29F52A73)
                  ),
                  child: Slider(value: height.toDouble(),min: 0.0,max: 210.0,activeColor:Color(0xFFEB1555) ,
                      onChanged:(double newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  } ),
                ),
              ],
            ),
            colour: Colors.black45,
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReUsableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('WEIGHT',
                    style: kTextstyle,),
                    Text(weight.toString(),
                    style: kNumberstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                               onPressed: () {
                                 setState(() {
                                   weight--;
                                 });
                               },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                          setState((){
                            weight++;
                          });
                          },
                        ),
                      ],
                    )

                  ],
                ),
                colour: Colors.black45,),
              ),
              Expanded(child: ReUsableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('AGE',
                      style: kTextstyle,),
                    Text(age.toString(),
                      style: kNumberstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState((){
                              age++;
                            });
                          },
                        ),
                      ],
                    )

                  ],
                ),
                colour: Colors.black45,),
              ),
            ],
          ),
          ),
          BottomButton(
            onTap: () {

              CalculatorBrain cal = CalculatorBrain(height: height,weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiresult: cal.calculateBMI(),
                  text: cal.getResult(),
                  interpretation: cal.getInterpretation(),
                )),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}





class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
    ),
        shape: CircleBorder(),
      fillColor: Colors.black26,
      elevation: 6.0,
    );
  }
}

