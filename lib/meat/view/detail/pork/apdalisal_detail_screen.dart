import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 앞다리 디테일
class ApdalisalDetailScreen extends StatefulWidget {
  const ApdalisalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<ApdalisalDetailScreen> createState() => _ApdalisalDetailScreenState();
}

class _ApdalisalDetailScreenState extends State<ApdalisalDetailScreen> {
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
            text: Text(
              '앞다리에서 사태살을 분리하고 남은 부위에요.',
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
                      text: '가격 대비 맛이 좋아 ',
                      style: detailThinContentStyle,
                    ),
                    TextSpan(
                      text: '가성비가 뛰어난 ',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: '부위에요.',
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
                    text: '밸런스가 좋아 ',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '어떤 요리에도 잘 어울려요.',
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
                    text: '지방이 적고 살코기가 많아, ',
                    style: detailThinContentStyle,
                  ),
                  TextSpan(
                    text: '다이어터',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '에게도 적합한 부위에요.',
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
                              text: '맛있는 고기는 먹고 싶지만, 지방이 많은 건 싫으신 분께 추천해요.',
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
                              text: '너무 많이 익히면 퍽퍽해져서, 적당한 조리가 필요해요!',
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
        // 맛있는 앞다리살 고르는법
        _ApdalisalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 앞다리살 추천 레시피
        _ApdalisalRecipe(),
      ],
    );
  }
}

// 맛있는 앞다리살 고르는법
class _ApdalisalChoosingTips extends StatefulWidget {
  const _ApdalisalChoosingTips();

  @override
  State<_ApdalisalChoosingTips> createState() => _ApdalisalChoosingTipsState();
}

class _ApdalisalChoosingTipsState extends State<_ApdalisalChoosingTips> {
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fapdalisal%2Fgood%2Fleaves_good.png?alt=media&token=9d3be3f0-868c-4dbb-a96d-792bfc6df973',
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fapdalisal%2Fbad%2Fleaves_bad.png?alt=media&token=9de6420c-0fa6-46e0-86df-d2c4d1ebf24d',
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [null],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [null],
  ];

  final List<String> titles = const ['낙엽 모양을 띄는 것'];

  // 강조할 문자열
  final List<String> highlights = const ['낙엽'];

  // 추가 설명
  final List<String> descriptions = const [
    '살코기가 여러 덩이인게 좋아요.',
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
            child: ChoosingYummyMeat(name: '앞다리살'),
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
              ['고기 중앙에서부터 갈라진 것', '하나의 살덩어리가 아닌 것'],
            ],
            badDescriptionsList: const [
              ['불규칙한 모양인 것', '고기가 갈라지지 않고 한 덩어리인 것'],
            ],
          )
        ],
      ),
    );
  }
}

// 앞다리살 추천 레시피
class _ApdalisalRecipe extends StatelessWidget {
  const _ApdalisalRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fapdalisal%2Frecipe%2F%E1%84%8B%E1%85%A1%E1%87%81%E1%84%83%E1%85%A1%E1%84%85%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%83%E1%85%AB%E1%84%8C%E1%85%B5%E1%84%87%E1%85%AE%E1%86%AF%E1%84%87%E1%85%A2%E1%86%A8.png?alt=media&token=0f1b4e06-1cdb-4577-a25d-7e4cb6c0eedf',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fapdalisal%2Frecipe%2F%E1%84%8B%E1%85%A1%E1%87%81%E1%84%83%E1%85%A1%E1%84%85%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%8B%E1%85%A1%E1%87%81%E1%84%83%E1%85%A1%E1%84%85%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF%E1%84%89%E1%85%AE%E1%84%8B%E1%85%B2%E1%86%A8.jpg?alt=media&token=fc67a848-7047-430a-97b6-c43db9d4d5c9',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fapdalisal%2Frecipe%2F%E1%84%8B%E1%85%A1%E1%87%81%E1%84%83%E1%85%A1%E1%84%85%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF3_%E1%84%83%E1%85%A9%E1%86%BC%E1%84%91%E1%85%A1%E1%84%8B%E1%85%B2%E1%86%A8.jpg?alt=media&token=16b58597-657a-44ae-817a-986506b44cfe',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fapdalisal%2Frecipe%2F%E1%84%8B%E1%85%A1%E1%87%81%E1%84%83%E1%85%A1%E1%84%85%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF4_%E1%84%8C%E1%85%A6%E1%84%8B%E1%85%B2%E1%86%A8%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7.png?alt=media&token=db4c7b22-0b41-4225-844b-de0cd2cea99c',
  ];
  final List<String> titles = const [
    '인플루언서 Pick!',
    '육식도감 Pick!',
    '이색적인 Pick!',
    '자취생 Pick!'
  ];
  final List<String> foodNames = const [
    '돼지불백',
    '앞다리살 수육',
    '앞다리살 동파육',
    '제육볶음',
  ];
  final List<String> linkUrls = const [
    'https://www.youtube.com/watch?v=Kx_4ecv9ZWU',
    'https://youtube.com/shorts/zHVjSV-OAYI?si=yQwCELu17rztt1aN',
    'https://youtube.com/shorts/JQLgEuVH_6U?si=ntKPnn7tmu6DRufT',
    'https://www.youtube.com/watch?v=spjIN3vPVVY',
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
