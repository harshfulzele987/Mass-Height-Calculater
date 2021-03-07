import 'package:flutter/material.dart';
import 'package:mass/constant/app_constant.dart';

class RightBar extends StatelessWidget {
  final double barwidth;

  const RightBar({Key key, @required  this.barwidth }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 25,
        width: barwidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(28),
            bottomRight: Radius.circular(20),

          ),
          color: accentHexcolor
          
          )
        ),
      
    ],
    );
  }
}