import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/common/utils/data_utils.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 목살 디테일
class MocksalDetailScreen extends StatefulWidget {
  static String get routeName => 'mocksal_detail';

  const MocksalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<MocksalDetailScreen> createState() => _MocksalDetailScreenState();
}

class _MocksalDetailScreenState extends State<MocksalDetailScreen> {
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
          const IntroduceRegion(),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 1,
            text:
                Text('목살은 머리와 등심 사이, 목의 살이에요.', style: detailThinContentStyle),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 2,
            text:
                Text('삼겹살 다음으로 인기있는 구이용 부위에요.', style: detailThinContentStyle),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '지방과 살코기', style: detailThinContentStyle),
                  TextSpan(
                    text: '비율이 조화',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(text: '로운 부위에요.', style: detailThinContentStyle),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 4,
            text: Text('목심, 목등심 등으로도 불려요.', style: detailThinContentStyle),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 5,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '고르는 방법',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '에 따라서 고기 맛의 차이가 커요.',
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
                                  text: '삼겹살보다 ',
                                  style: detailThinContentStyle),
                              TextSpan(
                                text: '담백한 구이',
                                style: detailBoldContentStyle.copyWith(
                                  backgroundColor:
                                      PRIMARY_COLOR.withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                  text: '를 선호한다면 추천해요.',
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
                                text: '지방과 살코기',
                                style: detailBoldContentStyle.copyWith(
                                  backgroundColor:
                                      PRIMARY_COLOR.withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                text: '를 분리해서 구우면 더 맛있어요.',
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
        // 맛있는 목살 고르는법
        _MocksalChoosingTips(),
        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),
        // 목살 추천 레시피
        MocksalRecipe(),
      ],
    );
  }
}

// 맛있는 목살 고르는법
class _MocksalChoosingTips extends StatefulWidget {
  const _MocksalChoosingTips();

  @override
  State<_MocksalChoosingTips> createState() => _MocksalChoosingTipsState();
}

class _MocksalChoosingTipsState extends State<_MocksalChoosingTips> {
  final List<String> gsGoodImageurls = const [
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
  ];

  List<String> goodImageUrls = [];

  final List<String> gsBadImageurls = const [
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
  ];

  List<String> badImageUrls = [];
  final List<String> titles = const [
    '고기가 섬을 이루는 것',
    '한쪽 살코기가 크지 않은 것',
    '지방이 희고 단단한 것'
  ];

  final List<String> highlights = const ['섬', '살코기', '희고 단단'];

  final List<String> descriptions = const [
    '섬이 많을수록 부드러워요.',
    '살코기가 커지면 퍽퍽해요.',
    '지방이 누런건 오래된 고기예요.'
  ];

  Future<void> fetchDownloadUrls() async {
    List<String> goodUrls =
        await DataUtils.convertMultipleGsToDownloadUrls(gsGoodImageurls);

    List<String> badUrls =
        await DataUtils.convertMultipleGsToDownloadUrls(gsBadImageurls);

    setState(() {
      goodImageUrls = goodUrls;
      badImageUrls = badUrls;
    });
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
              child: ChoosingYummyMeat(name: '목살')),
          const SizedBox(height: 16.0),
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

// 목살 추천 레시피
class MocksalRecipe extends StatelessWidget {
  const MocksalRecipe({super.key});

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
