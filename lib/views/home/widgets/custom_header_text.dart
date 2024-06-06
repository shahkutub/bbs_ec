import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({
    super.key,
    this.fontSize,
    this.fontWeight,
    required this.title,
  });
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Nikosh',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Colors.black,
        shadows: const [
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
            color: Color.fromARGB(255, 123, 121, 121),
          ),
          Shadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 8.0,
            color: Color.fromARGB(124, 206, 206, 209),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
