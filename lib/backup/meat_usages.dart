import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 고기 용도 카드 모음
class MeatUsages extends StatelessWidget {
  const MeatUsages({
    super.key,
    required this.usages,
  });

  final List<Usage> usages;

  @override
  Widget build(BuildContext context) {
    // 용도별 스타일
    Map<Usage, Map<String, dynamic>> usageStyles = {
      Usage.grilling: {
        'textColor': const Color(0xFFFF0000),
        'subColor': const Color(0xFFFFB7B7),
        'isFill': false
      },
      Usage.boiledPork: {
        'textColor': Colors.blue,
        'subColor': Colors.lightBlue,
        'isFill': false
      },
      Usage.soup: {
        'textColor': Colors.green,
        'subColor': Colors.lightGreen,
        'isFill': true
      },
      Usage.bulgogi: {
        'textColor': Colors.orange,
        'subColor': Colors.deepOrange,
        'isFill': false
      },
      Usage.cutlet: {
        'textColor': Colors.purple,
        'subColor': Colors.purpleAccent,
        'isFill': true
      },
      Usage.sweetAndSourPork: {
        'textColor': Colors.brown,
        'subColor': Colors.brown[300]!,
        'isFill': false
      },
      Usage.steak: {
        'textColor': Colors.black,
        'subColor': Colors.grey,
        'isFill': true
      },
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(usages.length, (index) {
        final usage = usages[index];
        final style = usageStyles[usage]!;

        return Padding(
          padding:
              EdgeInsets.only(right: index == usages.length - 1 ? 0.0 : 5.0),
          child: _UsageCard(
            usage: usage.label,
            textColor: style['textColor'] as Color,
            subColor: style['subColor'] as Color,
            isFill: style['isFill'] as bool,
          ),
        );
      }).toList(),
    );
  }
}

// 용도 카드
class _UsageCard extends StatelessWidget {
  const _UsageCard({
    required this.usage,
    required this.textColor,
    required this.subColor,
    required this.isFill,
  });

  final String usage; // 용도
  final Color textColor; // 글자색
  final Color subColor; // 배경색 혹은 테두리색
  final bool isFill; // 배경색인지 테두리색인지 여부

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: isFill ? subColor : Colors.white,
        border: isFill ? null : Border.all(color: subColor, width: 1.0),
      ),
      child: Text(
        usage,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.0,
          color: textColor,
        ),
      ),
    );
  }
}
