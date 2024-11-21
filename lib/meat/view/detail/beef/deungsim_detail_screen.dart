import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 등심 디테일
class DeungsimDetailScreen extends StatefulWidget {
  const DeungsimDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<DeungsimDetailScreen> createState() => _DeungsimDetailScreenState();
}

class _DeungsimDetailScreenState extends State<DeungsimDetailScreen> {
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
              '소의 등쪽에 위치한 부위에요.',
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
                      text: '윗등심',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: ', ',
                      style: detailThinContentStyle,
                    ),
                    TextSpan(
                      text: '꽃등심',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: ', ',
                      style: detailThinContentStyle,
                    ),
                    TextSpan(
                      text: '아랫등심',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: '으로 나뉘어요.',
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
                    text: '해외에서는 ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '척아이롤',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: ', ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '립아이',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '라고 불러요.',
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
                    text: '윗등심은 척아이롤에 포함돼요.',
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
                    text: '꽃듬심, 아랫등심은 립아이에 포함돼요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 6,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '고르는 방법에 따라서 맛의 차이가 커요.',
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
                              text: '스테이크를 먹고 싶은데, 어떤 부위를 먹을지 고민되는 분께 추천해요.',
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
                              text: '고기를 잘 고르는 것이 중요해요!',
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
        // 맛있는 등심 고르는법
        _DeungsimChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 등심 추천 레시피
        _DeungsimRecipe(),
      ],
    );
  }
}

// 맛있는 등심 고르는법
class _DeungsimChoosingTips extends StatefulWidget {
  const _DeungsimChoosingTips();

  @override
  State<_DeungsimChoosingTips> createState() => _DeungsimChoosingTipsState();
}

class _DeungsimChoosingTipsState extends State<_DeungsimChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fdeungsim%2Fgood%2Fsalchi_good.png?alt=media&token=5eafa853-cb37-495d-ada2-d7f88a1a212f'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d'
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fdeungsim%2Fbad%2Fsalchi_bad.png?alt=media&token=1f155147-d3bf-4a5c-ba9f-649b9d247357'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6'
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
    '[윗등심1] 살치살이 큰것',
    '[윗등심2] 널판근이 작은것',
    '[꽃/아랫등심1] 새우살이 큰것',
    '[꽃/아랫등심2] 덧살이 작은것',
    '[꽃/아랫등심3] 떡지방 작은것',
  ];

  // 강조할 문자열
  final List<String> highlights = const [
    '살치살',
    '널판근',
    '새우살',
    '덧살',
    '떡지방',
  ];

  // 추가 설명
  final List<String> descriptions = const [
    '살치살이 큰 것이 부드러워요.',
    '널판근이 작은 것이 부드러워요.',
    '새우살이 큰 것이 맛있어요.',
    '덧살이 작은 것이 부드러워요.',
    '떡지방은 못 먹어요...',
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
            child: ChoosingYummyMeat(name: '등심'),
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
              ['위 혹은 아래에 빗살무늬가 선명한 것', '빗살무늬가 살치살이에요'],
              ['위 혹은 아래에 빗살무늬가 선명한 것', '빗살무늬가 살치살이에요'],
              ['위 혹은 아래에 빗살무늬가 선명한 것', '빗살무늬가 살치살이에요'],
              ['위 혹은 아래에 빗살무늬가 선명한 것', '빗살무늬가 살치살이에요'],
              ['위 혹은 아래에 빗살무늬가 선명한 것', '빗살무늬가 살치살이에요'],
            ],
            badDescriptionsList: const [
              ['빗살무늬가 어디에도 없는 것', '다른 부위가 섞인 것'],
              ['빗살무늬가 어디에도 없는 것', '다른 부위가 섞인 것'],
              ['빗살무늬가 어디에도 없는 것', '다른 부위가 섞인 것'],
              ['빗살무늬가 어디에도 없는 것', '다른 부위가 섞인 것'],
              ['빗살무늬가 어디에도 없는 것', '다른 부위가 섞인 것'],
            ],
          )
        ],
      ),
    );
  }
}

// 등심 추천 레시피
class _DeungsimRecipe extends StatelessWidget {
  const _DeungsimRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fdeungsim%2Frecipe%2F%E1%84%83%E1%85%B3%E1%86%BC%E1%84%89%E1%85%B5%E1%86%B71_%E1%84%86%E1%85%A9%E1%86%BC%E1%84%80%E1%85%A9%E1%86%AF%E1%84%85%E1%85%B5%E1%84%8B%E1%85%A1%E1%86%AB%E1%84%87%E1%85%B5%E1%84%91%E1%85%B3.jpg?alt=media&token=78223073-b9b6-46a7-957f-d7932d8c604e',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fdeungsim%2Frecipe%2F%E1%84%83%E1%85%B3%E1%86%BC%E1%84%89%E1%85%B5%E1%86%B72_%E1%84%83%E1%85%B3%E1%86%BC%E1%84%89%E1%85%B5%E1%86%B7%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3.jpg?alt=media&token=ff6dfe67-a66e-4d22-b50c-62c3e32672c6',
  ];
  final List<String> titles = const ['이색적인 Pick', '육식도감 Pick'];
  final List<String> foodNames = const ['몽골리안비프', '등심 스테이크'];
  final List<String> linkUrls = const [
    'https://youtube.com/shorts/8Dkp3rO2mqs?si=PC9NzHLafRLK5KTI',
    'https://www.youtube.com/watch?v=MKlcJCWH-To'
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
