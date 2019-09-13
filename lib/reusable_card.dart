import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [
          new BoxShadow(
              color: Color.fromARGB(128, 0, 0, 0),
              offset: new Offset(0.0, 5.0),
              blurRadius: 15.0
          )
        ],
      ),
      child: cardChild,
    );
  }
}
