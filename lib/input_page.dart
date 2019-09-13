import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
//const inactiveCardColor = Color(0xFF111328);
const inactiveCardColor = Color(0xFF090a14);
const bottomBarColor = Color(0xFFEB1555);

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

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  Gender gender;

  //1 = male, 2 = female
  void updateColor(Gender selectedGender)
  {
    if (selectedGender == Gender.male)
    {
//      if (gender != selectedGender)
//      {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
        gender = Gender.male;
//      }
//      else
//      {
//        maleCardColor =  inactiveCardColor;
//        femaleCardColor = activeCardColor;
//        gender = Gender.female;
//      }
    }
  else
    {
//      if (gender != selectedGender)
//      {
        maleCardColor =  inactiveCardColor;
        femaleCardColor = activeCardColor;
        gender = Gender.female;
//      }
//      else
//      {
//        maleCardColor =  activeCardColor;
//        femaleCardColor = inactiveCardColor;
//        gender = Gender.male;
//      }

    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.insert_chart),
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      color: maleCardColor,
                      cardChild: IconWithText(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE'
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      color: femaleCardColor,
                      cardChild: IconWithText(
                            icon: FontAwesomeIcons.venus,
                            text: 'FEMALE'
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomBarColor,
            margin: EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}


