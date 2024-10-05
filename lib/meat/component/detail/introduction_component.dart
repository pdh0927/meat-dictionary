import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';

class IntroductionComponent extends StatelessWidget {
  const IntroductionComponent({
    super.key,
    required this.num,
    required this.text,
  });

  final int num;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: PRIMARY_COLOR,
            shape: BoxShape.circle,
          ),
          child: Text(
            num.toString(),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        text
      ],
    );
  }
}
