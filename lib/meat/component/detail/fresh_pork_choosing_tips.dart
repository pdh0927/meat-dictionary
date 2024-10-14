import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';

class FreshPorkChoosingTips extends StatelessWidget {
  const FreshPorkChoosingTips({super.key});

  final List<String> imagePaths = const [
    'assets/imgs/pork/fresh_choosing/1.png',
    'assets/imgs/pork/fresh_choosing/2.png',
    'assets/imgs/pork/fresh_choosing/3.png',
    'assets/imgs/pork/fresh_choosing/3.png',
  ];

  final List<String> titles = const [
    '흐물하지 않고 탄력 있는 것',
    '고기색이 분홍색을 띠는 것',
    '지방이 희고 단단한 것',
    '겉에 핏물이 없는 것',
  ];

  final List<String> highlights = const ['탄력', '분홍', '희고 단단', '핏물'];

  final List<String> descriptions = const [
    '탄력이 있을수록 신선해요.',
    '색이 희미하면 신선하지 않아요.',
    '지방이 누런건 오래된 고기예요.',
    '핏물이 나오지 않았을수록 신선해요.',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ChoosingFreshMeat()),
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
