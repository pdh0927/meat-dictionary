import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/common/utils/data_utils.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 앞다리 디테일
class ApdalisalDetailScreen extends StatefulWidget {
  static String get routeName => 'apdalisal_detail';

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
                              text: '맛있는 고기는 먹고싶지만, 지방이 많은건 싫으신 분께 추천해요.',
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
        ApdalisalRecipe(),
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
  final List<String> gsGoodImageurls = const [
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
  ];

  final List<String> gsBadImageurls = const [
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
  ];

  List<String> goodImageUrls = [];
  List<String> badImageUrls = [];

  final List<String> titles = const ['낙엽 모양을 띄는 것', '살코기 중간에 지방이 껴있는 것'];

  // 강조할 문자열
  final List<String> highlights = const ['낙엽', '지방'];

  // 추가 설명
  final List<String> descriptions = const [
    '살코기가 여러 덩이인게 좋아요.',
    '지방이 껴있어야 부드러워요.',
  ];

  // url 데이터 변환
  Future<void> fetchDownloadUrls() async {
    try {
      List<String> goodUrls =
          await DataUtils.convertMultipleGsToDownloadUrls(gsGoodImageurls);

      List<String> badUrls =
          await DataUtils.convertMultipleGsToDownloadUrls(gsBadImageurls);

      if (mounted) {
        setState(() {
          goodImageUrls = goodUrls;
          badImageUrls = badUrls;
        });
      }
    } catch (e) {
      print('Error fetching URLs: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDownloadUrls();
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

// 앞다리살 추천 레시피
class ApdalisalRecipe extends StatelessWidget {
  const ApdalisalRecipe({super.key});

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
