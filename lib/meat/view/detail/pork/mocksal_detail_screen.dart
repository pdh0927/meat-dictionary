import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 목살 디테일
class MocksalDetailScreen extends StatelessWidget {
  static String get routeName => 'mocksal_detail';

  const MocksalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context) {
    return CommonMeatDetailFrame(
      meatModel: meatModel,
      topChild: const _TopContents(),
      bottomChild: const _BottomContent(),
    );
  }
}

// 위쪽 컨텐츠
class _TopContents extends StatelessWidget {
  const _TopContents();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Introductions(),
        Divider(
          height: 48,
          thickness: 1.0,
          color: Color(0xFFD8D8D8),
        ),
        _Tips(),
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
                      style: detailThinContentStyle),
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
          const SizedBox(height: 16.0),
          // 내용
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                // 내용 1
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '💡',
                        style: detailBoldContentStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(text: '삼겹살보다 ', style: detailThinContentStyle),
                      TextSpan(
                        text: '담백한 구이',
                        style: detailBoldContentStyle.copyWith(
                          backgroundColor: PRIMARY_COLOR,
                        ),
                      ),
                      TextSpan(
                          text: '를 선호한다면 추천해요.', style: detailThinContentStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 13.0),
                // 내용 2
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '🥩',
                        style: detailBoldContentStyle.copyWith(fontSize: 20),
                      ),
                      TextSpan(
                        text: '지방과 살코기',
                        style: detailBoldContentStyle.copyWith(
                          backgroundColor: PRIMARY_COLOR,
                        ),
                      ),
                      TextSpan(
                        text: '를 분리해서 구우면 더 맛있어요.',
                        style: detailThinContentStyle,
                      ),
                    ],
                  ),
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
    return const Placeholder();
  }
}
