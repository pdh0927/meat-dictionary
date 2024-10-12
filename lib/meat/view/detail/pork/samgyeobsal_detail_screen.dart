import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 삼겹살 디테일
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
  } // 메뉴 선택 시 스크롤 위치로 이동하는 함수

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
        // 고기 소개 및 특징
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _Introductions(),
              Divider(
                height: 48,
                thickness: 1.0,
                color: Color(0xFFD8D8D8),
              ),
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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '부위 ', style: detailThinContentStyle),
                TextSpan(
                  text: '소개',
                  style: detailBoldContentStyle,
                ),
              ],
            ),
          ),
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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '개발자의 ',
                  style: detailThinContentStyle,
                ),
                TextSpan(
                  text: '팁',
                  style: detailBoldContentStyle,
                ),
              ],
            ),
          ),
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
        SamgyeobsalRecipe(),
      ],
    );
  }
}

// 맛있는 삼겹살 고르는법
class _SamgyeobsalChoosingTips extends StatelessWidget {
  const _SamgyeobsalChoosingTips();

  final List<String> imagePaths = const [
    'assets/imgs/pork/fresh_choosing/1.png',
    'assets/imgs/pork/fresh_choosing/2.png',
  ];

  final List<String> titles = const ['오돌뼈가 존재 하는 것', '갈비 뗀 자국이 존재하는 것'];

  final List<String> highlights = const ['오돌뼈', '갈비 뗀 자국'];

  final List<String> descriptions = const [
    '끝 쪽에 있을수록 더 좋은 고기예요.',
    '자국이 크면 클수록 좋아요.',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '맛있는 ', style: detailThinContentStyle),
                  TextSpan(text: '삼겹살 ', style: detailBoldContentStyle),
                  TextSpan(
                    text: '고르는법',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          HorizontalImages(
            imagePaths: imagePaths,
            titles: titles,
            highlights: highlights,
            descriptions: descriptions,
          )
        ],
      ),
    );
  }
}

// 삼겹살 추천 레시피
class SamgyeobsalRecipe extends StatelessWidget {
  const SamgyeobsalRecipe({super.key});

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