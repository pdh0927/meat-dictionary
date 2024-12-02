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
          names: const ['부위 소개', '고르는 법', '추천 레시피'],
          offsets: const [300, 900, 1400],
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
  final List<List<String>> goodImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Fgood%2Fodolppyeo_good.png?alt=media&token=4b7c3736-a3c7-4065-b014-8ead14e5d9fc'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Fgood%2Fgagook_good.png?alt=media&token=1aa76abf-d68a-4ffb-bdea-95793cbdf220'
    ],
  ];

  final List<List<String>> badImageUrls = const [
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Fbad%2Fodolppyeo_bad.png?alt=media&token=f697686a-23af-4685-98b1-c0219aac5ef8'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Fbad%2Fgagookl_bad.png?alt=media&token=a70a8c32-6681-4bfd-972c-fc66e6b86232'
    ],
  ];

  final List<List<String?>> goodDetailImageUrls = const [
    [null],
    [null],
  ];

  final List<List<String?>> badDetailImageUrls = const [
    [null],
    [null],
  ];

  final List<String> titles = const ['오돌뼈가 끝 쪽에 있는 것', '갈비 뗀 자국이 존재하는 것'];

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
            goodImageUrlList: goodImageUrls,
            badImageUrlsList: badImageUrls,
            goodDetailImageUrls: goodDetailImageUrls,
            badDetailImageUrls: badDetailImageUrls,
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
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Frecipe%2Fairflyer_samgyeob.png?alt=media&token=1f4abdf9-dcb2-43dc-b592-d212109b9d10',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Frecipe%2Fsamgyeobsal_potato_jolim.png?alt=media&token=6d4f9501-c044-4035-9caa-7749feb84173',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Frecipe%2Fnaengsampadeopbab.png?alt=media&token=988b045b-eb3e-4b28-b4e4-c06cf8d524f4',
    'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Frecipe%2Fsamgyeobsal_deopbab.png?alt=media&token=b616a516-9c9d-40d1-be64-eaae38eb68e0',
  ];
  final List<String> titles = const [
    '육식도감 PICK',
    '자취생 PICK',
    '인플루언서 PICK',
    '이색적인 PICK',
  ];
  final List<String> foodNames = const [
    '에어프라이어 통삼겹!',
    '삼겹살 감자조림',
    '냉삼파덮밥',
    '삼겹살 덮밥',
  ];
  final List<String> linkUrls = const [
    'https://www.youtube.com/shorts/HnJWnXmvM8o',
    'https://www.youtube.com/watch?v=dHaPmBmKNEU',
    'https://www.youtube.com/watch?v=ZkgnxTVMGi0',
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
