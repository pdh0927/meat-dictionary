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
          names: const ['부위 소개', '고르는 법', '추천 레시피'],
          offsets: const [300, 930, 1350],
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
            text: Text('삼겹살 위 내장 가까이에 있는 부위예요.', style: detailThinContentStyle),
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
                                  text: '을 느끼고 싶은 분께 추천해요.',
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
        _GalmaegisalRecipe(),
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
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2Fcolor_good.png?alt=media&token=0e0eca34-be97-46e5-a54b-69c9720d44b7'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2Fsmell_good.png?alt=media&token=b875d2f0-0ff1-4914-ba1c-6f3629e3c28c'
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fbad%2Fsmell_bad.png?alt=media&token=ae0a2aa9-8204-449b-a5fe-28ec6bdd8439'
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [null],
    [null],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [null],
    [null],
  ];

  final List<String> titles = const [
    '짙은 붉은색을 띠는 것',
    '꿉꿉한 냄새가 나지 않는 것',
  ];

  // 강조 문자열
  final List<String> highlights = const [
    '짙은 붉은색',
    '꿉꿉한 냄새',
  ];

  final List<String> descriptions = const [
    '너무 옅은 색이나 갈색은 피해주세요.',
    '부패 상태를 확인할 수 있어요.',
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
            goodImageUrlList: goodImageUrls,
            badImageUrlsList: badImageUrls,
            goodDetailImageUrls: goodDetailImageUrls,
            badDetailImageUrls: badDetailImageUrls,
            goodDescriptionsList: const [
              ['어둡지만 확실히 붉은색인 것'],
              ['신선한 피 냄새가 나는 것'],
            ],
            badDescriptionsList: const [
              ['탁한 갈색을 띠는 것'],
              ['내장 주변이라 부패 잘 일어남'],
            ],
          )
        ],
      ),
    );
  }
}

// 갈매기살 추천 레시피
class _GalmaegisalRecipe extends StatelessWidget {
  const _GalmaegisalRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Frecipe%2F%E1%84%80%E1%85%A1%E1%86%AF%E1%84%86%E1%85%A2%E1%84%80%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%8E%E1%85%A1%E1%84%8B%E1%85%A8%E1%84%85%E1%85%A7%E1%86%AB%E1%84%80%E1%85%A1%E1%86%AF%E1%84%86%E1%85%A2%E1%84%80%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF%E1%84%89%E1%85%AE%E1%84%8B%E1%85%B2%E1%86%A8.jpg?alt=media&token=0310eaec-0da7-4b24-8d5c-398442f51fbd',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Frecipe%2F%E1%84%80%E1%85%A1%E1%86%AF%E1%84%86%E1%85%A2%E1%84%80%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%8B%E1%85%A3%E1%86%BC%E1%84%82%E1%85%A7%E1%86%B7%E1%84%80%E1%85%A1%E1%86%AF%E1%84%86%E1%85%A2%E1%84%80%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF.jpg?alt=media&token=884b90fc-ca7f-40c6-932f-9e6acfbb402e',
  ];
  final List<String> titles = const ['인플루언서 Pick!', '육식도감 Pick!'];
  final List<String> foodNames = const ['갈매기살 수육', '양념갈매기살'];
  final List<String> linkUrls = const [
    'https://youtube.com/shorts/iRaaEg3t6ik?si=mk71nuBLOqkAHi8A',
    'https://youtu.be/dVxxQw39KKU?si=aGmuIhkiQkq6uZOv'
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
