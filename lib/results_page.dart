import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'input_page.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({
    @required this.bmi,
    @required this.resultText,
    @required this.interpretation,
});

  final String bmi;
  final String resultText;
  final String interpretation;


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
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
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
                  Text(resultText,style: kResultTextStyle,),
                  Text(bmi,style: kBMITextStyle,),
                  Text(interpretation,style:kBodyTextStyle,textAlign: TextAlign.center,),
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
