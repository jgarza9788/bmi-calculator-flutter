import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'input_page.dart';
import 'bottom_button.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Results',style: kTitleTextStyle,textAlign: TextAlign.center,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('normal',style: kResultTextStyle,),
                  Text('18.3',style: kBMITextStyle,),
                  Text('Your BMI Result is low, you should eat more.',style:kBodyTextStyle,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(
            text:'re-Calculate',
            onPressed: ()
              {
              Navigator.pop(context,MaterialPageRoute(builder: (context){return InputPage();}));
              }
              ),
            ],
      ),
    );
  }
}
