import 'package:flutter/material.dart';

class CustomContentText extends StatelessWidget {
  const CustomContentText({
    super.key,
    required this.dotSize,
    required this.text,
    required this.textStyle,
  });

  final double dotSize;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 점
        Text(
          '•',
          style: TextStyle(
              fontSize: dotSize,
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        const SizedBox(width: 8), // 점과 텍스트 사이의 간격
        // 텍스트
        Expanded(
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }
}
