import 'package:flutter/material.dart';

class MinusAddbutton extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  final String num;
  final Function() onPressed;
  const MinusAddbutton({
    Key? key,
    required this.num,
    required this.onPressed,
    required this.boxColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: boxColor, shape: BoxShape.circle
          // color: Colors.white,
          ),
      height: 50,
      width: 50,
      child: MaterialButton(
        padding: EdgeInsets.all(8),
        onPressed: onPressed,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Text(
          "$num",
          style: TextStyle(fontSize: 40, color: textColor),
        )),
      ),
    );
  }
}