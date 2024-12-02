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

// 항정살 디테일
class HangjeongsalDetailScreen extends StatefulWidget {
  const HangjeongsalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<HangjeongsalDetailScreen> createState() =>
      _HangjeongsalDetailScreenState();
}

class _HangjeongsalDetailScreenState extends State<HangjeongsalDetailScreen> {
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
          offsets: const [300, 800, 1200],
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
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '한 마리당 500g~1kg만 나오는 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '특수부위',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '예요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 2,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '돼지 중 가장',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '부드럽고',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: ', ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '아삭한',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '식감을 자랑해요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '돼지의 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '차돌박이',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '라고도 불려요.',
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
                                text: '색다른 식감',
                                style: detailBoldContentStyle.copyWith(
                                    backgroundColor:
                                        PRIMARY_COLOR.withOpacity(0.6)),
                              ),
                              TextSpan(
                                text: '과 ',
                                style: detailThinContentStyle,
                              ),
                              TextSpan(
                                text: '고소한 풍미',
                                style: detailBoldContentStyle.copyWith(
                                    backgroundColor:
                                        PRIMARY_COLOR.withOpacity(0.6)),
                              ),
                              TextSpan(
                                text: '를 느끼고 싶은 분께 추천해요.',
                                style: detailThinContentStyle,
                              ),
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
                                text: '지방이 많아서 덜 익히면 물컹해져요.',
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
        // 맛있는 항정살 고르는법
        _HangjeongsalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 항정살 추천 레시피
        _HangjeongsalRecipe(),
      ],
    );
  }
}

// 맛있는 항정살 고르는법
class _HangjeongsalChoosingTips extends StatefulWidget {
  const _HangjeongsalChoosingTips();

  @override
  State<_HangjeongsalChoosingTips> createState() =>
      _HangjeongsalChoosingTipsState();
}

class _HangjeongsalChoosingTipsState extends State<_HangjeongsalChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fgood%2Fmabling_good.png?alt=media&token=6acc9386-6077-4377-9ab8-63e2b9071ab9',
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [null],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [null],
  ];

  final List<String> titles = const [
    '마블링이 촘촘한 것',
  ];

  // 강조 문자열
  final List<String> highlights = const ['마블링'];

  // 추가 설명
  final List<String> descriptions = const [
    '항정살도 살코기의 마블링이 중요해요.',
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
            child: ChoosingYummyMeat(name: '항정살'),
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
              ['살코기에도 마블링이 좋은 것', '더 부드럽게 먹을 수 있어요'],
            ],
            badDescriptionsList: const [
              ['마블링 없는 살코기에 위아래 지방이 붙은 것'],
            ],
          )
        ],
      ),
    );
  }
}

// 항정살 추천 레시피
class _HangjeongsalRecipe extends StatelessWidget {
  const _HangjeongsalRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Frecipe%2F%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=59605f16-2d8e-45ab-bf78-70e900509c32',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Frecipe%2F%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF%20%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=77ceadb9-ea5f-4937-a51a-387a20c6dffc',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Frecipe%2F%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF3_%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF%E1%84%81%E1%85%AA%E1%84%85%E1%85%B5%E1%84%80%E1%85%A9%E1%84%8E%E1%85%AE%E1%84%8C%E1%85%A9%E1%84%85%E1%85%B5%E1%86%B7.jpg?alt=media&token=37ce9d0d-8da0-4c6f-8292-55a2126c419a',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Frecipe%2F%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF4_%E1%84%89%E1%85%A5%E1%86%BC%E1%84%89%E1%85%B5%E1%84%80%E1%85%A7%E1%86%BC%E1%84%92%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%AF%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=90f04e54-db87-45dd-9312-eebcac43f73c',
  ];
  final List<String> titles = const [
    '육식도감 Pick!',
    '자취생 Pick!',
    '이색적인 Pick!',
    '인플루언서 Pick!'
  ];
  final List<String> foodNames = const [
    '항정살 덮밥',
    '간편 항정살 덮밥',
    '항정살 꽈리고추조림',
    '성시경의 항정살 덮밥'
  ];
  final List<String> linkUrls = const [
    'https://youtu.be/EwmcDl5fYIA?si=0e-rdhyG2VPSpNuk',
    'https://youtu.be/ZuciTGjIc3s?si=_wowAuoKteax-O8Y',
    'https://youtu.be/2pIWPGjzNB0?si=1kNksm_0C0wp4eSF',
    'https://youtu.be/lMSjisuPbm4?si=PjxlrpRMq-roT_r1'
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
