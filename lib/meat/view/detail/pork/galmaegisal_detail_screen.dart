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

// 갈매기살 디테일
class GalmaegisalDetailScreen extends StatefulWidget {
  static String get routeName => 'galmaegisal_detail';

  const GalmaegisalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<GalmaegisalDetailScreen> createState() =>
      _GalmaegisalDetailScreenState();
}

class _GalmaegisalDetailScreenState extends State<GalmaegisalDetailScreen> {
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
                    text: '갈매기의 살',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '이 아니예요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 2,
            text: Text('삼겹살 위에 있는 부위예요.', style: detailThinContentStyle),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '한 마리당 300~400g만 나오는 ',
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
            num: 4,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '내장에 가까이 있어서 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '육향',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '이 강해요!',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 5,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '내장에 가까이 있어서 구입 후 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '빨리 ',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '먹어야 해요.',
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
                                  text: '육향이 강한 ',
                                  style: detailThinContentStyle),
                              TextSpan(
                                text: '돼지의 참맛',
                                style: detailBoldContentStyle.copyWith(
                                  backgroundColor:
                                      PRIMARY_COLOR.withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                  text: '을 느끼고 싶은분께 추천해요.',
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
                                text: '바싹 익히면 육즙이 다 사라져서 퍽퍽해요.',
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
        // 맛있는 갈매기살 고르는법
        _GalmaegisalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 갈매기살 추천 레시피
        GalmaegisalRecipe(),
      ],
    );
  }
}

// 맛있는 갈매기살 고르는법
class _GalmaegisalChoosingTips extends StatefulWidget {
  const _GalmaegisalChoosingTips();

  @override
  State<_GalmaegisalChoosingTips> createState() =>
      _GalmaegisalChoosingTipsState();
}

class _GalmaegisalChoosingTipsState extends State<_GalmaegisalChoosingTips> {
  final List<String> goodImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
  ];

  final List<String> badImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
  ];

  final List<String> titles = const [
    '짙은 붉은색을 띄는 것',
    '꿉꿉한 냄새가 나지 않는 것',
    '적당한 지방이 있는 것'
  ];

  // 강조 문자열
  final List<String> highlights = const ['짙은 붉은색', '꿉꿉한 냄새', '적당한 지방'];

  final List<String> descriptions = const [
    '너무 옅은색이나 갈색은 피해주세요.',
    '부패 상태를 확인할 수 있어요.',
    '한층 더 부드럽게 느껴져요.'
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
            child: ChoosingYummyMeat(name: '갈매기살'),
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
              ['근육이 많이 갈라진 것', '하나의 근육이 아닌 것', '하나의 근육이 아닌 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
            ],
            badDescriptionsList: const [
              [
                '하나의 근육이 아닌 것',
                '하나의 근육이 아닌 것',
                '하나의 근육이 아닌 것',
              ],
              ['지방이 거의 없는 것', '지방이 거의 없는 것'],
            ],
          )
        ],
      ),
    );
  }
}

// 갈매기살 추천 레시피
class GalmaegisalRecipe extends StatelessWidget {
  const GalmaegisalRecipe({super.key});

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
