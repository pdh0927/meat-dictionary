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
          names: const ['부위 소개', '고르는 법', '추천 레시피'],
          offsets: const [300, 900, 1250],
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
        _AnsimRecipe(),
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
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Fgood%2Fcircle_good.png?alt=media&token=755e4080-4582-4f04-9da0-b2635ea2cbd7'
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Fbad%2Fcircle_bad.png?alt=media&token=f98077ef-8638-44b2-ae67-1f72f8027bbc',
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Fgood%2Fcircle_good2.png?alt=media&token=c47e1465-d860-420e-ae00-b41c4c59d09e'
    ],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Fbad%2Fcircle_bad2.png?alt=media&token=fd2cd4e9-6518-4252-9dd7-d97e03ceee9e'
    ],
  ];

  final List<String> titles = const [
    '가장 원에 가까운 것',
  ];

  // 강조할 문자열
  final List<String> highlights = const ['원'];

  // 추가 설명
  final List<String> descriptions = const [
    '원에 가까울수록 좋은 부위에요.',
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
            goodImageUrlList: goodImageUrls,
            badImageUrlsList: badImageUrls,
            goodDetailImageUrls: goodDetailImageUrls,
            badDetailImageUrls: badDetailImageUrls,
            goodDescriptionsList: const [
              ['가장 동그란 것', '샤토브리앙'],
              ['하나의 고기 덩어리인 것'],
              ['살코기로만 이루어진 것', '마블링이 많은 것'],
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
class _AnsimRecipe extends StatelessWidget {
  const _AnsimRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Frecipe%2F%E1%84%8B%E1%85%A1%E1%86%AB%E1%84%89%E1%85%B5%E1%86%B71_%E1%84%8B%E1%85%A1%E1%86%AB%E1%84%89%E1%85%B5%E1%86%B7%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3.jpg?alt=media&token=3e13898f-3eed-46b2-aeb0-9aab6fe51d9b',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Frecipe%2F%E1%84%8B%E1%85%A1%E1%86%AB%E1%84%89%E1%85%B5%E1%86%B72_%E1%84%87%E1%85%B5%E1%84%91%E1%85%B3%E1%84%8B%E1%85%B0%E1%86%AF%E1%84%85%E1%85%B5%E1%86%BC%E1%84%90%E1%85%A5%E1%86%AB.jpg?alt=media&token=e4458d2a-8b25-4e9e-aa85-4e5cb8f2345f',
  ];
  final List<String> titles = const ['육식도감 Pick!', '이색적인 Pick!'];
  final List<String> foodNames = const ['안심스테이크', '비프웰링턴'];
  final List<String> linkUrls = const [
    'https://youtube.com/shorts/Mxe0Y10OOq4?si=3agDlAbgzTDSUNtO',
    'https://youtube.com/shorts/PvBLpJRieos?si=Pc-WaBiFqkRqudKS'
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
