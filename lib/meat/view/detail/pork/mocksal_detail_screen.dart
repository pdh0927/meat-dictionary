import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 목살 디테일
class MocksalDetailScreen extends StatefulWidget {
  const MocksalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<MocksalDetailScreen> createState() => _MocksalDetailScreenState();
}

class _MocksalDetailScreenState extends State<MocksalDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 메뉴 선택 시 스크롤 위치로 이동하는 함수
  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonMeatDetailFrame(
      meatModel: widget.meatModel,
      topChild: _TopContents(onMenuSelected: _scrollToSection),
      bottomChild: const _BottomContent(),
      scrollController: _scrollController,
    );
  }
}

// 위쪽 컨텐츠
class _TopContents extends StatelessWidget {
  const _TopContents({required this.onMenuSelected});
  final Function(double) onMenuSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 바로가기 메뉴
        DetailMenuBar(
          names: const ['부위 소개', '고르는 법', '추천 레시피'],
          offsets: const [300, 900, 1400],
          onMenuSelected: onMenuSelected,
        ),

        const SizedBox(height: 18.0),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // 고기 소개 및 특징
              _Introductions(),

              Divider(
                height: 48,
                thickness: 1.0,
                color: Color(0xFFD8D8D8),
              ),

              // 개발자의 팁
              _Tips(),
            ],
          ),
        ),
      ],
    );
  }
}

// 고기 소개 및 특징
class _Introductions extends StatelessWidget {
  const _Introductions();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          const IntroduceRegion(),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 1,
            text:
                Text('목살은 머리와 등심 사이, 목의 살이에요.', style: detailThinContentStyle),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 2,
            text:
                Text('삼겹살 다음으로 인기 있는 구이용 부위에요.', style: detailThinContentStyle),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '지방과 살코기', style: detailThinContentStyle),
                  TextSpan(
                    text: '비율이 조화',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(text: '로운 부위에요.', style: detailThinContentStyle),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 4,
            text: Text('목심, 목등심 등으로도 불려요.', style: detailThinContentStyle),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 5,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '고르는 방법',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '에 따라서 고기 맛의 차이가 커요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 개발자의 팁
class _Tips extends StatelessWidget {
  const _Tips();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          const DeveloperTips(),

          const SizedBox(height: 12.0),

          // 내용
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                // 내용 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '💡 ',
                      style: detailBoldContentStyle.copyWith(fontSize: 20),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '삼겹살보다 ',
                                  style: detailThinContentStyle),
                              TextSpan(
                                text: '담백한 구이',
                                style: detailBoldContentStyle.copyWith(
                                  backgroundColor:
                                      PRIMARY_COLOR.withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                  text: '를 선호한다면 추천해요.',
                                  style: detailThinContentStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13.0),
                // 내용 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '🥩 ',
                      style: detailBoldContentStyle.copyWith(fontSize: 20),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '지방과 살코기',
                                style: detailBoldContentStyle.copyWith(
                                  backgroundColor:
                                      PRIMARY_COLOR.withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                text: '를 분리해서 구우면 더 맛있어요.',
                                style: detailThinContentStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 아래쪽 컨텐츠
class _BottomContent extends StatelessWidget {
  const _BottomContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // 맛있는 목살 고르는법
        _MocksalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 목살 추천 레시피
        _MocksalRecipe(),
      ],
    );
  }
}

// 맛있는 목살 고르는법
class _MocksalChoosingTips extends StatefulWidget {
  const _MocksalChoosingTips();

  @override
  State<_MocksalChoosingTips> createState() => _MocksalChoosingTipsState();
}

class _MocksalChoosingTipsState extends State<_MocksalChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Fgood%2Fsum_good.png?alt=media&token=47e92230-6cf8-4727-9674-e0e72b2c33a9',
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Fbad%2Fsum_bad.png?alt=media&token=fe591891-314f-4b2b-8ae8-3b87dcd11ca8',
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [
      "https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Fgood%2Fsum_good2.png?alt=media&token=54fad350-825c-4cb6-9325-5933b753be02"
    ],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Fbad%2Fsum_bad2.png?alt=media&token=bda520e3-52da-475b-87b5-73a7da54d896'
    ],
  ];

  final List<String> titles = const [
    '고기가 섬을 이루는 것',
  ];

  // 강조 문자열
  final List<String> highlights = const ['섬'];

  // 추가 설명
  final List<String> descriptions = const [
    '섬이 많을수록 부드러워요.',
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
            child: ChoosingYummyMeat(
              name: '목살',
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
              ['고기가 지방을 두고 많이 갈라진 것', '사이사이 지방이 많이 낀 것'],
            ],
            badDescriptionsList: const [
              ['고기 섬이 많이 없는 것', '하나의 살코기가 큰 것'],
            ],
          )
        ],
      ),
    );
  }
}

// 목살 추천 레시피
class _MocksalRecipe extends StatelessWidget {
  const _MocksalRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Frecipe%2F%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%80%E1%85%A1%E1%86%B7%E1%84%8C%E1%85%A1%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF%E1%84%8D%E1%85%A1%E1%84%80%E1%85%B3%E1%86%AF%E1%84%8B%E1%85%B5.jpg?alt=media&token=5391d829-d2d5-47d9-8d96-cf5c891784ee',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Frecipe%2F%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%86%E1%85%A2%E1%84%8F%E1%85%A9%E1%86%B7%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF%E1%84%80%E1%85%AE%E1%84%8B%E1%85%B5.jpg?alt=media&token=5a8b3bb6-4237-4d9a-98b8-2f245936c68e',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Frecipe%2F%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF3_%E1%84%8B%E1%85%A3%E1%86%BC%E1%84%82%E1%85%A7%E1%86%B7%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=c2cbd4a1-1044-45ea-a605-ab7f920af2ad',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Frecipe%2F%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF4_%E1%84%86%E1%85%A2%E1%84%8B%E1%85%AE%E1%86%AB%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%86%E1%85%A9%E1%86%A8%E1%84%89%E1%85%A1%E1%86%AF%E1%84%8D%E1%85%B5%E1%86%B7.jpg?alt=media&token=8d6fdb1f-ab3b-45fb-b6eb-cafdab239d5c',
  ];
  final List<String> titles = const [
    '인플루언서 Pick!',
    '육식도감 Pick!',
    '이색적인 Pick!',
    '자취생 Pick!'
  ];
  final List<String> foodNames = const [
    '감자목살짜글이',
    '매콤목살구이',
    '양념목살덮밥',
    '매운김치목살찜'
  ];
  final List<String> linkUrls = const [
    'https://youtu.be/yjsTAAnBZqs?si=UzwU2_w3YhUcfEr2',
    'https://youtu.be/3jt_vdD60tk?si=2TD6Tnt5vtu-5Z0D',
    'https://youtu.be/gs17aCSBgN4?si=14TpEw6CcQSZyaNf',
    'https://youtu.be/09li1coY4As?si=Ng-BdahVlPgXNUt9'
  ];

  @override
  Widget build(BuildContext context) {
    return RecipeWidgetFrame(
      imageUrls: imageUrls,
      titles: titles,
      foodNames: foodNames,
      linkUrls: linkUrls,
    );
  }
}
