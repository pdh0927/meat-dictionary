import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 부위 소개
class IntroduceRegion extends StatelessWidget {
  const IntroduceRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '부위 ',
            style: detailThinSmallTitleStyle,
          ),
          TextSpan(
            text: '소개',
            style: detailBoldSmallTitleStyle,
          ),
        ],
      ),
    );
  }
}

// 개발자의 팁
class DeveloperTips extends StatelessWidget {
  const DeveloperTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '개발자의 ',
            style: detailThinSmallTitleStyle,
          ),
          TextSpan(
            text: '팁',
            style: detailBoldSmallTitleStyle,
          ),
        ],
      ),
    );
  }
}

// 풍미 그래프
class AttributesGraph extends StatelessWidget {
  const AttributesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '풍미 ',
            style: detailBoldSmallTitleStyle,
          ),
          TextSpan(
            text: '그래프',
            style: detailThinSmallTitleStyle,
          ),
        ],
      ),
    );
  }
}

// 맛있는 고기 고르는법
class ChoosingYummyMeat extends StatelessWidget {
  const ChoosingYummyMeat({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '맛있는 ',
            style: detailThinSmallTitleStyle,
          ),
          TextSpan(
            text: name,
            style: detailBoldSmallTitleStyle,
          ),
          TextSpan(
            text: ' 고르는법',
            style: detailThinSmallTitleStyle,
          ),
        ],
      ),
    );
  }
}

// 신선한 고기 고르는법
class ChoosingFreshMeat extends StatelessWidget {
  const ChoosingFreshMeat({
    super.key,
    required this.type,
  });

  final MeatType type;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '좋은 ',
            style: detailThinSmallTitleStyle,
          ),
          TextSpan(
            text: '${type == MeatType.pork ? '돼지고기' : '소고기'} ',
            style: detailBoldSmallTitleStyle,
          ),
          TextSpan(
            text: '고르는법',
            style: detailThinSmallTitleStyle,
          ),
        ],
      ),
    );
  }
}
