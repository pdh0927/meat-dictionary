import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 안심 디테일
class AnsimDetailScreen extends StatefulWidget {
  const AnsimDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<AnsimDetailScreen> createState() => _AnsimDetailScreenState();
}

class _AnsimDetailScreenState extends State<AnsimDetailScreen> {
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
            text: Text(
              '허리 안쪽 근육 운동이 거의 없는 부위에요.',
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
                      text: '소에서 ',
                      style: detailThinContentStyle,
                    ),
                    TextSpan(
                      text: '가장 부드러운 근육',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: '이에요.',
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
                    text: '소 한마리에서 나오는 양이 적은 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '고급부위',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '에요.',
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
                    text: '지방이 거의 없는 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '순수 살코기',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '라서 담백하고 깔끔해요.',
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
                              text: '부드러운 식감과 담백함을 선호하기는 분께 추천해요.',
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
                              text: '안심은 스테이크로만 먹읍시다!',
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
        // 맛있는 안심 고르는법
        _AnsimChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 안심 추천 레시피
        AnsimRecipe(),
      ],
    );
  }
}

// 맛있는 안심 고르는법
class _AnsimChoosingTips extends StatefulWidget {
  const _AnsimChoosingTips();

  @override
  State<_AnsimChoosingTips> createState() => __AnsimChoosingTipsState();
}

class __AnsimChoosingTipsState extends State<_AnsimChoosingTips> {
  final List<String> goodImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
  ];

  final List<String> badImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
  ];

  final List<String> titles = const [
    '가장 원에 가까운 것',
    '하나의 큰 덩이를 이루는 것',
    '떡지방이 작은 것'
  ];

  // 강조할 문자열
  final List<String> highlights = const ['원', '큰 덩이', '떡지방'];

  // 추가 설명
  final List<String> descriptions = const [
    '원에 가까울수록 좋은 부위에요.',
    '옆에 붙은 고기는 질겨요.',
    '지방을 돈내고 먹을 필욘 없어요.',
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
            child: ChoosingYummyMeat(name: '안심'),
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
              ['가장 동그란 것', '샤토브리앙'],
              ['하나의 고기 덩어리인 것'],
              ['살코기로만 이루어 진 것', '마블링이 많은 것'],
            ],
            badDescriptionsList: const [
              ['타원형으로 길쭉한 것'],
              ['여러 덩이가 붙어서 된 것'],
              ['떡지방이 큰 것', '마블링은 떡지방이 아니에요'],
            ],
          )
        ],
      ),
    );
  }
}

// 안심 추천 레시피
class AnsimRecipe extends StatelessWidget {
  const AnsimRecipe({super.key});

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
