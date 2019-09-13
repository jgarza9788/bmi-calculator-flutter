//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender
{
  male,
  female
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender gender;

  void updateColor(Gender selectedGender)
  {
    gender = selectedGender;
    maleCardColor = (gender==Gender.male)? kActiveCardColor: kInactiveCardColor;
    femaleCardColor = (gender==Gender.female)? kActiveCardColor: kInactiveCardColor;
  }

  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.insert_chart),
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: maleCardColor,
                    cardChild: IconWithText(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE'
                    ),
                    onPress: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: femaleCardColor,
                    cardChild: IconWithText(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE'
                    ),
                    onPress: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
//            flex: 2,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGreyColor,
                      thumbColor: kPinkColor,
                      overlayColor: kPinkOverlayColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,

                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed:(){
                                setState(() {
                                  weight -=1;
                                });
                              }
                            ),
                            SizedBox(width: 15.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed:(){
                                setState(() {
                                  weight +=1;
                                });
                              }
                            ),
                          ]
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed:(){
                                    setState(() {
                                      age -=1;
                                    });
                                  }
                              ),
                              SizedBox(width: 15.0,),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed:(){
                                    setState(() {
                                      age +=1;
                                    });
                                  }
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'Calculate',
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context){return ResultsPage();})
              );
          }),
        ],
      )
    );
  }
}




class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: kLightGreyColor,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,height: 56.0,
      ),
    );
  }
}

