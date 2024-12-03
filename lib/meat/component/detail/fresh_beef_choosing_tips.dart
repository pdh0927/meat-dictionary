import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 신선한 소고기 고르는 방법
class FreshBeefChoosingTips extends StatefulWidget {
  const FreshBeefChoosingTips({super.key});

  @override
  State<FreshBeefChoosingTips> createState() => _FreshBeefChoosingTipsState();
}

class _FreshBeefChoosingTipsState extends State<FreshBeefChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Felasticity_good.png?alt=media&token=5c5608fc-0e3f-4d27-95bf-ee9e1a98b530'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fgood%2Fcolor_good.png?alt=media&token=e18985ba-bca4-49e8-b264-9904cb864a31'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fgood%2Fblood_good.png?alt=media&token=67740b50-dc34-4c76-bd79-80840fbc033b'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fgood%2Fmabling_good.png?alt=media&token=7e9486bc-a5ec-4a75-83af-9cf00aa70805'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fgood%2Ffat_good.png?alt=media&token=4186ca20-a6aa-49e6-902e-9e1fb6c514fb'
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Felasticity_bad.png?alt=media&token=a08b6d9b-64c4-47d7-8548-fcd74a1d5d6f'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fbad%2Fcolor_bad.png?alt=media&token=86358403-6e02-4461-a7ed-7fb55180cc6d'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fbad%2Fblood_bad.png?alt=media&token=bfc58b3d-cc5d-475b-b7e8-3a9bacc3965f'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fbad%2Fmabling_bad.png?alt=media&token=21454430-f854-4c98-a43a-6636819220dd'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Ffresh-choosing%2Fbad%2Ffat_bad.png?alt=media&token=9d977042-2582-4af5-814b-7bc1a3018843'
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [null],
    [null],
    [null],
    [null],
    [null],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [null],
    [null],
    [null],
    [null],
    [null],
  ];

  final List<String> titles = const [
    '흐물하지 않고 탄력 있는 것',
    '고기가 선명한 붉은색을 띠는 것',
    '겉에 핏물이 없는 것',
    '마블링이 고르게 퍼져 있는 것',
    '떡지방이 적은 것',
  ];

  // 강조 문자열
  final List<String> highlights = const ['탄력', '선명한 붉은색', '핏물', '마블링', '떡지방'];

  // 추가 설명
  final List<String> descriptions = const [
    '탄력이 있을수록 신선해요.',
    '색이 붉은것이 신선해요.',
    '핏물이 나오지 않았을수록 신선해요.',
    '감칠맛은 마블링에서 와요.',
    '지방을 돈을 주고 살 이유는 없어요.',
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
            child: ChoosingFreshMeat(
              type: MeatType.beef,
            ),
          ),

          const SizedBox(height: 16.0),

          // 가로 스크롤 이미지
          HorizontalImages(
            titles: titles,
            highlights: highlights,
            descriptions: descriptions,
            goodImageUrlList: goodImageUrls,
            badImageUrlsList: badImageUrls,
            goodDetailImageUrls: goodDetailImageUrls,
            badDetailImageUrls: badDetailImageUrls,
            goodDescriptionsList: const [
              ['흐물하지 않고 탄력이 있는 것', '눌렀을 때 원상복귀가 빠른 것'],
              ['선명한 붉은색을 띄는 것'],
              ['핏물(드립)이 많이 나오지 않은 것'],
              ['상대적으로 마블링 많은 것'],
              ['같은 조건이라면 떡지방이 작은 것', '지방이 최대한 손질된 것'],
            ],
            badDescriptionsList: const [
              ['고기가 흐물흐물한 것', '눌렀을 때 천천히 돌아오는 것'],
              ['너무 어두운 색인 것', '갈색으로 변색된 것'],
              ['겉에 핏물이 많이 나온 것'],
              ['마블링이 거의 없는 것', '지방덩어리(떡지방)이 큰 것'],
              ['떡지방이 큰 것', '지방 가격을 빼주지는 않아요'],
            ],
          )
        ],
      ),
    );
  }
}
