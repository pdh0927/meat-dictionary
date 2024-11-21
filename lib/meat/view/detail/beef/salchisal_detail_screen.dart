import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 살치살 디테일
class SalchisalDetailScreen extends StatefulWidget {
  const SalchisalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<SalchisalDetailScreen> createState() => _SalchisalDetailScreenState();
}

class _SalchisalDetailScreenState extends State<SalchisalDetailScreen> {
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
          offsets: const [300, 800, 1100],
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
              '소의 윗등심에 붙어있는 부위에요.',
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
                      text: '매우 ',
                      style: detailThinContentStyle,
                    ),
                    TextSpan(
                      text: '화려한 마블링',
                      style: detailBoldContentStyle,
                    ),
                    TextSpan(
                      text: '이 특징이에요.',
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
                      text: '마블링이 많은 만큼 엄청 부드러워요.',
                      style: detailThinContentStyle,
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 4,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '소에서 가장 비싼 부위 중 하나에요.',
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
                              text: '부드럽고 고급진 맛을 느끼고 싶으신분께 추천해요.',
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
                              text: '마블링이 많은 부위로, 바짝 익혀서 드세요!',
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
        // 맛있는 살치살 고르는법
        _SalchisalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 살치살 추천 레시피
        _SalchisalRecipe(),
      ],
    );
  }
}

// 맛있는 살치살 고르는법
class _SalchisalChoosingTips extends StatefulWidget {
  const _SalchisalChoosingTips();

  @override
  State<_SalchisalChoosingTips> createState() => _SalchisalChoosingTipsState();
}

class _SalchisalChoosingTipsState extends State<_SalchisalChoosingTips> {
  final List<String> goodImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
  ];

  final List<String> badImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
  ];

  final List<String> titles = const [
    '등급이 높은 것',
  ];

  // 강조할 문자열
  final List<String> highlights = const ['등급'];

  // 추가 설명
  final List<String> descriptions = const [
    '어느정도의 지방 함럄이 필요해요.',
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
            child: ChoosingYummyMeat(name: '살치살'),
          ),

          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              '신선한 고기를 고르면 다 맛있어요!',
              style: detailThinContentStyle,
            ),
          ),
          // 가로 스크롤 이미지
        ],
      ),
    );
  }
}

// 살치살 추천 레시피
class _SalchisalRecipe extends StatelessWidget {
  const _SalchisalRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fsalchisal%2Frecipe%2F%E1%84%89%E1%85%A1%E1%86%AF%E1%84%8E%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%89%E1%85%A1%E1%86%AF%E1%84%8E%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3.jpg?alt=media&token=0c6435dd-17e0-4840-8e5a-82d1bf6023eb',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fsalchisal%2Frecipe%2F%E1%84%89%E1%85%A1%E1%86%AF%E1%84%8E%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%89%E1%85%A1%E1%86%AF%E1%84%8E%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3.jpg?alt=media&token=5a141517-6d25-4466-a5e6-41cec67b9558',
  ];
  final List<String> titles = const ['육식도감 Pick', '자취생 Pick'];
  final List<String> foodNames = const ['살치살 스테이크', '초스피드 살치살 스테이크'];
  final List<String> linkUrls = const [
    'https://youtube.com/shorts/ReaQrFMWh7c?si=1LM8wm7lr_Li9yAQ',
    'https://youtube.com/shorts/a6fwhlB7LCg?si=bwfVVkhcCtTiofHz'
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
