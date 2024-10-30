import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';

// 신선한 돼지고기 고르는 방법
class FreshPorkChoosingTips extends StatefulWidget {
  const FreshPorkChoosingTips({super.key});

  @override
  State<FreshPorkChoosingTips> createState() => _FreshPorkChoosingTipsState();
}

class _FreshPorkChoosingTipsState extends State<FreshPorkChoosingTips> {
  final List<String> goodImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Felasticity_good.png?alt=media&token=5c5608fc-0e3f-4d27-95bf-ee9e1a98b530',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Felasticity_good.png?alt=media&token=5c5608fc-0e3f-4d27-95bf-ee9e1a98b530',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Felasticity_good.png?alt=media&token=5c5608fc-0e3f-4d27-95bf-ee9e1a98b530',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Fblood_good.png?alt=media&token=6ea29f4b-fb33-4905-abc8-c7e1b481d560',
  ];

  final List<String> badImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Felasticity_bad.png?alt=media&token=a08b6d9b-64c4-47d7-8548-fcd74a1d5d6f',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Felasticity_bad.png?alt=media&token=a08b6d9b-64c4-47d7-8548-fcd74a1d5d6f',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Felasticity_bad.png?alt=media&token=a08b6d9b-64c4-47d7-8548-fcd74a1d5d6f',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Fblood_bad.png?alt=media&token=9cd1f17e-8870-46eb-aedf-19e90e7a20c7',
  ];

  final List<String> titles = const [
    '흐물하지 않고 탄력 있는 것',
    '고기가 맑은 분홍색을 띠는 것',
    '지방이 희고 단단한 것',
    '겉에 핏물이 없는 것',
  ];

  // 강조 문자열
  final List<String> highlights = const ['탄력', '분맑은 분홍색홍', '희고 단단', '핏물'];

  // 추가 설명
  final List<String> descriptions = const [
    '탄력이 있을수록 신선해요.',
    '색이 탁할수록 신선하지 않아요.',
    '지방이 누런건 오래된 고기예요.',
    '핏물이 나오지 않았을수록 신선해요.',
  ];

  @override
  void initState() {
    super.initState();
  }

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
            child: ChoosingFreshMeat(),
          ),

          const SizedBox(height: 16.0),

          // 가로 스크롤 이미지
          HorizontalImages(
            titles: titles,
            highlights: highlights,
            descriptions: descriptions,
            goodImageUrls: goodImageUrls,
            badImageUrls: badImageUrls,
            goodDescriptionsList: const [
              ['흐물하지 않고 탄력이 있는 것', '눌렀을 때 원상복귀가 빠른 것'],
              ['고기가 맑은 분홍색을 띠는 것'],
              ['지방이 흰색인 것', '지방이 단단한 것'],
              ['겉에 핏물이 없는 것'],
            ],
            badDescriptionsList: const [
              ['고기가 흐물흐물한 것', '눌렀을 때 천천히 돌아오는 것'],
              ['고기가 회색인 것', '고기가 갈변된 것'],
              ['지방이 누런색 인 것', '지방이 흐물흐물한 것'],
              ['겉에 핏물이 많이 나온 것'],
            ],
          )
        ],
      ),
    );
  }
}
