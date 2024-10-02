import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/common_meat_detail_frame.dart';
import 'package:meat_dictionary/meat/component/detail/introduction_component.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

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
      topChild: const _Introductions(),
      bottomChild: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '부위 ',
                  style: detailSmallTitleStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '소개',
                  style: detailSmallTitleStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 1,
            text: Text(
              '목살은 머리와 등심 사이, 목의 살이에요.',
              style: detailSmallTitleStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 2,
            text: Text(
              '삼겹살 다음으로 인기있는 구이용 부위에요.',
              style: detailSmallTitleStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 3,
            text: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '지방과 살코기',
                    style: detailSmallTitleStyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '비율이 조화',
                    style: detailSmallTitleStyle,
                  ),
                  TextSpan(
                    text: '로운 부위에요.',
                    style: detailSmallTitleStyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          IntroductionComponent(
            num: 4,
            text: Text(
              '목심, 목등심 등으로도 불려요.',
              style: detailSmallTitleStyle.copyWith(
                fontWeight: FontWeight.w400,
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
                    text: '고르는 방법',
                    style: detailSmallTitleStyle,
                  ),
                  TextSpan(
                    text: '에 따라서 고기 맛의 차이가 커요.',
                    style: detailSmallTitleStyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
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
