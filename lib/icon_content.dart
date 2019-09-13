import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  IconWithText({this.icon, this.text,});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//                        SizedBox(height: 10.0,),
        Icon(
            icon,
            size:80.0
        ),
        SizedBox(height: 15.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0XFF8D8E98),
          ),
        ),
      ],
    );
  }
}
