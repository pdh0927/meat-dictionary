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
  static String get routeName => 'hangjeongsal_detail';

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
          names: ['1', '2', '3', '4'],
          offsets: [500, 1000, 1500, 2000],
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
                                text: '를 느끼고 싶은분께 추천해요.',
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
        HangjeongsalRecipe(),
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
  final List<String> goodImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
  ];

  final List<String> badImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
  ];

  final List<String> titles = const [
    '지방이 희고 탄탄한 것',
    '마블링이 촘촘한 것',
  ];

  // 강조 문자열
  final List<String> highlights = const ['희고 탄탄', '마블링'];

  // 추가 설명
  final List<String> descriptions = const [
    '항정살은 특히나 지방이 중요해요.',
    '마블링 = 지방.',
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
            goodImageUrls: goodImageUrls,
            badImageUrls: badImageUrls,
            goodDescriptionsList: const [
              ['근육이 많이 갈라진 것', '하나의 근육이 아닌 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
            ],
            badDescriptionsList: const [
              ['하나의 근육이 아닌 것'],
              ['지방이 거의 없는 것', '지방이 거의 없는 것'],
            ],
          )
        ],
      ),
    );
  }
}

// 항정살 추천 레시피
class HangjeongsalRecipe extends StatelessWidget {
  const HangjeongsalRecipe({super.key});

  final List<String> imageUrls = const [
    'assets/imgs/pork/mocksal/recipe/1.png',
    'assets/imgs/pork/mocksal/recipe/2.png',
    'assets/imgs/pork/mocksal/recipe/3.png',
    'assets/imgs/pork/mocksal/recipe/4.png',
  ];
  final List<String> titles = const [
    '인플루언서 PICK',
    '자취생 PICK',
    '육식도감 PICK',
    'HOT',
  ];
  final List<String> foodNames = const [
    '목살 수육',
    '제육복음',
    '목살 스테이크',
    '목살 간장 덮밥',
  ];
  final List<String> linkUrls = const [
    'https://www.youtube.com/watch?v=_FKZDjgXm90',
    'https://www.youtube.com/watch?v=_FKZDjgXm90',
    'https://www.youtube.com/watch?v=_FKZDjgXm90',
    'https://www.youtube.com/watch?v=_FKZDjgXm90',
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
