import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';

class FreshPorkChoosingTips extends StatelessWidget {
  const FreshPorkChoosingTips({super.key});

  final List<String> imagePaths = const [
    'assets/imgs/pork/fresh_choosing/1.png',
    'assets/imgs/pork/fresh_choosing/2.png',
    'assets/imgs/pork/fresh_choosing/3.png'
  ];

  final List<String> titles = const [
    '흐물하지 않고 탄력 있는 것',
    '고기색이 분홍색을 띠는 것',
    '지방이 희고 단단한 것'
  ];

  final List<String> highlights = const ['탄력', '분홍', '희고 단단'];

  final List<String> descriptions = const [
    '탄력이 있을수록 신선해요.',
    '색이 희미하면 신선하지 않아요.',
    '지방이 누런건 오래된 고기예요.'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '신선한 고기 ', style: detailBoldContentStyle),
                  TextSpan(
                    text: '고르는법',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          HorizontalImages(
            imagePaths: imagePaths,
            titles: titles,
            highlights: highlights,
            descriptions: descriptions,
          )
        ],
      ),
    );
  }
}
