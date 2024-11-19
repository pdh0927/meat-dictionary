import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 신선한 돼지고기 고르는 방법
class FreshPorkChoosingTips extends StatefulWidget {
  const FreshPorkChoosingTips({super.key});

  @override
  State<FreshPorkChoosingTips> createState() => _FreshPorkChoosingTipsState();
}

class _FreshPorkChoosingTipsState extends State<FreshPorkChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Felasticity_good.png?alt=media&token=5c5608fc-0e3f-4d27-95bf-ee9e1a98b530'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Fblood_good.png?alt=media&token=b530f128-84f5-44c4-9345-3a3e6bd3805f'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fgood%2Fpink_good.jpeg?alt=media&token=28552f7a-249b-4aa5-91d6-4d77dedc7b82'
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Felasticity_bad.png?alt=media&token=a08b6d9b-64c4-47d7-8548-fcd74a1d5d6f'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Ffresh-choosing%2Fpork%2Fbad%2Fblood_bad.png?alt=media&token=5ac07319-2963-433f-b935-b3fd8313beb8'
    ],
    [],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [null],
    [null],
    [null],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [null],
    [null],
    [null],
  ];

  final List<String> titles = const [
    '흐물하지 않고 탄력 있는 것',
    '겉에 핏물이 없는 것',
    '고기가 맑은 분홍색을 띠는 것',
  ];

  // 강조 문자열
  final List<String> highlights = const [
    '탄력',
    '핏물',
    '맑은 분홍색',
  ];

  // 추가 설명
  final List<String> descriptions = const [
    '탄력이 있을수록 신선해요.',
    '핏물이 나오지 않았을수록 신선해요.',
    '색이 탁할수록 신선하지 않아요.',
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
              type: MeatType.pork,
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
              ['겉에 핏물이 없는 것'],
              ['고기가 맑은 분홍색을 띠는 것'],
            ],
            badDescriptionsList: const [
              ['고기가 흐물흐물한 것', '눌렀을 때 천천히 돌아오는 것'],
              ['겉에 핏물이 많이 나온 것'],
              ['고기가 회색인 것', '고기가 갈변된 것'],
            ],
          )
        ],
      ),
    );
  }
}
