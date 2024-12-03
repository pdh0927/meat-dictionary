import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 부채살 디테일
class BuchaesalDetailScreen extends StatefulWidget {
  const BuchaesalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<BuchaesalDetailScreen> createState() => _BuchaesalDetailScreenState();
}

class _BuchaesalDetailScreenState extends State<BuchaesalDetailScreen> {
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
          offsets: const [300, 850, 1300],
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
            text: Text(
              '소의 앞다리 뒤쪽 부분이에요.',
              style: detailThinContentStyle,
            ),
          ),

          const SizedBox(height: 16.0),

          IntroductionComponent(
              num: 2,
              text: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '가운데에 박힌 ',
                      style: detailThinContentStyle,
                    ),
                    TextSpan(
                      text: '힘줄',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: '이 가장 큰 특징이에요.',
                      style: detailThinContentStyle,
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '마블링은 많진 않지만, 근육 자체가 질기진 않아요.',
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
                    text: '합리적인 가격',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '에 비해 맛이 좋아요.',
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
          Column(
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
                              text: '합리적인 가격에 괜찮은 고기를 드시고 싶은 분께 추천해요.',
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
                              text: '가운데 힘줄은 잘 익혀 드세요!',
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
        // 맛있는 부채살 고르는법
        _BuchaesalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 부채살 추천 레시피
        _BuchaesalRecipe(),
      ],
    );
  }
}

// 맛있는 부채살 고르는법
class _BuchaesalChoosingTips extends StatefulWidget {
  const _BuchaesalChoosingTips();

  @override
  State<_BuchaesalChoosingTips> createState() => _BuchaesalChoosingTipsState();
}

class _BuchaesalChoosingTipsState extends State<_BuchaesalChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Fgood%2FforceString_good.png?alt=media&token=a0b1614f-0ff2-4bce-8f2c-151c1cc0ba55',
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Fbad%2FforceString_bad.png?alt=media&token=fdae878e-a154-4cbf-91ab-142aeb8ac950',
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Fgood%2FforceString_good2.png?alt=media&token=647030dc-8085-4682-936a-a1667160ed10'
    ],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Fbad%2FforceString_bad2.png?alt=media&token=5abe96ec-563c-453a-9b3e-644209327f47'
    ],
  ];

  final List<String> titles = const [
    '가운데 힘줄이 얇은 것',
  ];

  // 강조할 문자열
  final List<String> highlights = const ['힘줄'];

  // 추가 설명
  final List<String> descriptions = const [
    '힘줄이 얇은 쪽 고기가 부드러워요.',
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
            child: ChoosingYummyMeat(name: '부채살'),
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
              ['가운데 힘줄이 얇은 것', '힘줄이 얇아야 굽기도 쉬워요'],
            ],
            badDescriptionsList: const [
              ['가운데 힘줄이 두꺼운 것', '힘줄이 두꺼울수록 조리도 어려워요.'],
            ],
          )
        ],
      ),
    );
  }
}

// 부채살 추천 레시피
class _BuchaesalRecipe extends StatelessWidget {
  const _BuchaesalRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Frecipe%2F%E1%84%87%E1%85%AE%E1%84%8E%E1%85%A2%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%87%E1%85%AE%E1%84%8E%E1%85%A2%E1%84%89%E1%85%A1%E1%86%AF%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=3603a076-914e-4fc0-ae22-3ed3c3dbec69',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Frecipe%2F%E1%84%87%E1%85%AE%E1%84%8E%E1%85%A2%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%87%E1%85%AE%E1%84%8E%E1%85%A2%E1%84%89%E1%85%A1%E1%86%AF%20%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3.jpg?alt=media&token=bbdbd389-da97-4ca7-858d-bf8bcb7f2852',
  ];
  final List<String> titles = const ['이색적인 Pick', '육식도감 Pick!'];
  final List<String> foodNames = const ['부채살덮밥', '부채살스테이크'];
  final List<String> linkUrls = const [
    'https://youtu.be/2KXO_af8U9k?si=PlTFQ_ARE_pN0IfO',
    'https://youtube.com/shorts/COIQ2SSFDjE?si=iYfUv-Z2EM2aNnw5'
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
