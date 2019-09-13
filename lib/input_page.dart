import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override

  Widget build(BuildContext context) {

    double ThisMargin = 5.0;
    double roundedCorners = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
//      body: Container(
//        margin: EdgeInsets.all(ThisMargin),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(20.0),
//          color: Color(0xFF1D1E33),
//        ),
//      ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: new ReusableCard(ThisMargin: ThisMargin, roundedCorners: roundedCorners),
              ),
              Expanded(
                child: new ReusableCard(ThisMargin: ThisMargin, roundedCorners: roundedCorners),
              ),
            ],
          ),
        ),
        Expanded(
          child: new ReusableCard(ThisMargin: ThisMargin, roundedCorners: roundedCorners),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: new ReusableCard(ThisMargin: ThisMargin, roundedCorners: roundedCorners),
              ),
              Expanded(
                child: new ReusableCard(ThisMargin: ThisMargin, roundedCorners: roundedCorners),
              ),
            ],
          ),
        ),
      ],
    )
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
    @required this.ThisMargin,
    @required this.roundedCorners,
  }) : super(key: key);

  final double ThisMargin;
  final double roundedCorners;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ThisMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(roundedCorners),
        color: Color(0xFF1D1E33),
      ),
    );
  }
}
