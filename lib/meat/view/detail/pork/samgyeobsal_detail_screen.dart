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

// 삼겹살 디테일 화면
class SamgyeobsalDetailScreen extends StatefulWidget {
  static String get routeName => 'samgyeobsal_detail';

  const SamgyeobsalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<SamgyeobsalDetailScreen> createState() =>
      _SamgyeobsalDetailScreenState();
}

class _SamgyeobsalDetailScreenState extends State<SamgyeobsalDetailScreen> {
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
            text: Text('돼지의 뱃살이에요.', style: detailThinContentStyle),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 2,
            text: Text('한국인이 가장 좋아하는 고기예요.', style: detailThinContentStyle),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '오겹살', style: detailBoldContentStyle),
                  TextSpan(text: ' = ', style: detailThinContentStyle),
                  TextSpan(text: '삼겹살', style: detailBoldContentStyle),
                  TextSpan(text: ' + ', style: detailThinContentStyle),
                  TextSpan(text: '돼지껍데기', style: detailBoldContentStyle),
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
                  TextSpan(text: '삼겹살은 ', style: detailThinContentStyle),
                  TextSpan(text: '갈빗대', style: detailBoldContentStyle),
                  TextSpan(text: ', ', style: detailThinContentStyle),
                  TextSpan(text: '미추리 ', style: detailBoldContentStyle),
                  TextSpan(
                    text: '두 부분으로 나뉘어요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 5,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '갈빗대 부분',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '이 더 선호도가 높아요.',
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
                              text: '기름진 맛',
                              style: detailBoldContentStyle.copyWith(
                                backgroundColor: PRIMARY_COLOR.withOpacity(0.6),
                              ),
                            ),
                            TextSpan(
                                text: '에 소주 한잔 하실 분께 추천해요.',
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
                              text: '지방이',
                              style: detailThinContentStyle,
                            ),
                            TextSpan(
                              text: '투명색',
                              style: detailBoldContentStyle.copyWith(
                                backgroundColor: PRIMARY_COLOR.withOpacity(0.6),
                              ),
                            ),
                            TextSpan(
                              text: '이 되면 더 익히지 마세요!',
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
        // 맛있는 삼겹살 고르는법
        _SamgyeobsalChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 삼겹살 추천 레시피
        _SamgyeobsalRecipe(),
      ],
    );
  }
}

// 맛있는 삼겹살 고르는법
class _SamgyeobsalChoosingTips extends StatefulWidget {
  const _SamgyeobsalChoosingTips();

  @override
  State<_SamgyeobsalChoosingTips> createState() =>
      _SamgyeobsalChoosingTipsState();
}

class _SamgyeobsalChoosingTipsState extends State<_SamgyeobsalChoosingTips> {
  final List<String> goodImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F1.jpg?alt=media&token=8ec5fe9e-1f5e-478c-9158-8e492fd5f11d',
  ];

  final List<String> badImageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgood%2F2.jpg?alt=media&token=53faf929-74a0-4c9e-9316-d55a5e11b8c6',
  ];

  final List<String> titles = const ['오돌뼈가 끝쪽에 있는 것', '갈비 뗀 자국이 존재하는 것'];

  // 강조 문자열
  final List<String> highlights = const ['오돌뼈', '갈비 뗀 자국'];

  // 추가 설명
  final List<String> descriptions = const [
    '끝 쪽에 있을수록 더 좋은 고기예요.',
    '자국이 크면 클수록 좋아요.',
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
            child: ChoosingYummyMeat(name: '삼겹살'),
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

// 삼겹살 추천 레시피
class _SamgyeobsalRecipe extends StatelessWidget {
  const _SamgyeobsalRecipe();

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
