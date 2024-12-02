import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/detail_menu_bar.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/component/detail/recipe_widget.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 갈비 디테일
class GalbiDetailScreen extends StatefulWidget {
  const GalbiDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  State<GalbiDetailScreen> createState() => _GalbiDetailScreenState();
}

class _GalbiDetailScreenState extends State<GalbiDetailScreen> {
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
              '소의 갈비뼈와 그 주변부의 살을 갈비라고 해요.',
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
                      text: '뼈 위에 붙은 고기를 갈비, 뼈 사이의 고기를 갈비살(늑간살)이라고 불러요.',
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
                    text: '갈비뼈 위치에 따라 꽃갈비, 본갈비, 참갈비로 나뉘어요.',
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
                    text: '꽃갈비',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '는 마블링이 좋아 구이용으로 적합해요.',
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
                    text: '본갈비',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '는 마블링이 좋은것은 구이, 아닌것은 찜이나 탕으로 추천해요.',
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
                    text: '참갈비',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '는 식감이 있어서 찜으로 추천해요.',
                    style: detailThinContentStyle,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          IntroductionComponent(
            num: 7,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '갈비살(늑간살)',
                    style: detailBoldContentStyle,
                  ),
                  TextSpan(
                    text: '은 씹는맛이 있고, 육향이 강한 부위에요.',
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
                              text: '무난한 구이용 부위를 고르신다면 추천해요.',
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
                              text: '특징에 맞는 고기 선택를 선택해주세요.',
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
        // 맛있는 갈비 고르는법
        _GalbiChoosingTips(),

        Divider(
          height: 48.0,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),

        // 갈비 추천 레시피
        _GalbiRecipe(),
      ],
    );
  }
}

// 맛있는 갈비 고르는법
class _GalbiChoosingTips extends StatefulWidget {
  const _GalbiChoosingTips();

  @override
  State<_GalbiChoosingTips> createState() => _ChadolbagiChoosingTipsState();
}

class _ChadolbagiChoosingTipsState extends State<_GalbiChoosingTips> {
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
            child: ChoosingYummyMeat(name: '갈비'),
          ),

          const SizedBox(height: 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              '신선한 고기를 고르면 다 맛있어요!',
              style: detailThinContentStyle,
            ),
          ),
        ],
      ),
    );
  }
}

// 갈비 추천 레시피
class _GalbiRecipe extends StatelessWidget {
  const _GalbiRecipe();

  final List<String> imageUrls = const [
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fgalbi%2Frecipe%2F%E1%84%80%E1%85%A1%E1%86%AF%E1%84%87%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF1_%E1%84%8B%E1%85%A3%E1%86%BC%E1%84%82%E1%85%A7%E1%86%B7%E1%84%80%E1%85%A1%E1%86%AF%E1%84%87%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF.jpg?alt=media&token=a45715af-2724-4404-91be-edbdd95ecfde',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fgalbi%2Frecipe%2F%E1%84%80%E1%85%A1%E1%86%AF%E1%84%87%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF2_%E1%84%80%E1%85%A1%E1%86%AF%E1%84%87%E1%85%B5%E1%84%89%E1%85%A1%E1%86%AF%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=5c1458f1-b30e-41ba-8594-10b7203ba2c0',
  ];
  final List<String> titles = const ['이색적인 Pick', '육식도감 Pick'];
  final List<String> foodNames = const ['양념갈비살', '갈비살 덮밥'];
  final List<String> linkUrls = const [
    'https://youtu.be/5718bGlGNfQ?si=Ns-mpB4hqPbFnbQ1',
    'https://youtube.com/shorts/tUN5qd1FlqE?si=DyD0VU3reMufj3Ht'
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
