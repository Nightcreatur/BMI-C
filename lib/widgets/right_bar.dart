import 'package:bmi/constants/app_constant.dart';
import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(20),
              ),
              color: accentHex),
        )
      ],
    );
  }
}