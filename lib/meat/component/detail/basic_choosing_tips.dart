import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/custom_content_text.dart';

class BasicChoosingTips extends StatelessWidget {
  const BasicChoosingTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Text('기본적으로 고기 잘 고르는 법 💡', style: detailTitleStyle),
          const SizedBox(height: 13.0),
          const _Content(
            number: 1,
            mainContent: '흐물흐물하지 않고 가장 탄력이 있는 것',
            subContent: '탄력이 있을수록 신선해요',
          ),
          const SizedBox(height: 10.0),
          const _Content(
            number: 2,
            mainContent: '마블링이 가장 선명한 것',
            subContent: '마블링이 진할수록 부드러워요.',
          ),
          const SizedBox(height: 10.0),
          const _Content(
            number: 3,
            mainContent: '색이 가장 진한 것',
            subContent: '색이 진할수록 육향이 강해요.',
          ),
        ],
      ),
    );
  }
}

class _CustomCircleNumber extends StatelessWidget {
  const _CustomCircleNumber({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.0,
      height: 32.0,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFFF4F6FA),
        shape: BoxShape.circle,
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.number,
    required this.mainContent,
    required this.subContent,
  });

  final int number;
  final String mainContent;
  final String subContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _CustomCircleNumber(number: number),
            const SizedBox(width: 18.0),
            Text(
              mainContent,
              style: detailTitleStyle.copyWith(fontSize: 17.0),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: CustomContentText(
            dotSize: 15.0,
            text: subContent,
            textStyle: detailContentStyle,
          ),
        )
      ],
    );
  }
}
