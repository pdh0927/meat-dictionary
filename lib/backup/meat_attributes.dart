import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:sizer/sizer.dart';

// 고기 속성 수치
class MeatAttributes extends StatelessWidget {
  const MeatAttributes({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 식감 수치
        _AttributeBar(
          width: 80.w,
          title: '식감',
          minLabel: '부드러움',
          maxLabel: '쫄깃함',
          valueLabel: meatModel.texture.label,
          sliderPosition: meatModel.texture.sliderValue * (80.w - 60),
          gradientColors: const [
            Color(0xFFFF0D00),
            Color(0xFFFF0D00),
            Color(0xFFFF0072),
          ],
        ),
        const SizedBox(height: 12),
        // 지방 수치
        _AttributeBar(
          width: 80.w,
          title: '지방',
          minLabel: '적음',
          maxLabel: '많음',
          valueLabel: meatModel.savoryFlavor.label,
          sliderPosition: meatModel.savoryFlavor.sliderValue * (80.w - 60),
          gradientColors: const [
            Color(0xFF9DF200),
            Color(0xFF44C400),
            Color(0xFF0093B4),
          ],
        ),
        const SizedBox(height: 12),
        // 육향 수치
        _AttributeBar(
          width: 80.w,
          title: '육향',
          minLabel: '적음',
          maxLabel: '많음',
          valueLabel: meatModel.meatAroma.label,
          sliderPosition: meatModel.meatAroma.sliderValue * (80.w - 60),
          gradientColors: const [
            Color(0xFF007BFE),
            Color(0xFF5856D6),
            Color(0xFFAF52DE),
          ],
        ),
      ],
    );
  }
}

// 속성바
class _AttributeBar extends StatelessWidget {
  const _AttributeBar({
    required this.width,
    required this.title,
    required this.minLabel,
    required this.maxLabel,
    required this.valueLabel,
    required this.sliderPosition,
    required this.gradientColors,
  });

  final String title;
  final String minLabel;
  final String maxLabel;
  final String valueLabel;
  final double sliderPosition;
  final List<Color> gradientColors;
  final double width;

  @override
  Widget build(BuildContext context) {
    // valueLabel의 길이를 계산
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: valueLabel,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final double valueLabelWidth = textPainter.size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // 속성 이름
        Container(
          width: 45,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: const Color(0xFFE0F2FF),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: width - 45,
          child: Stack(
            children: [
              SizedBox(
                height: 59.0,
                child: Row(
                  children: [
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 12),
                        // 배경바
                        _BackgroundBar(width: width - 60, height: 10),
                        const SizedBox(height: 3.0),
                        // 수치 최대, 최소 라벨
                        _ValueLabel(
                            width: width - 60,
                            minLabel: minLabel,
                            maxLabel: maxLabel)
                      ],
                    ),
                  ],
                ),
              ),
              // 수치바
              Positioned(
                left: sliderPosition + 15,
                top: 33,
                child: _ValueBar(
                  width: (width - 60) / 5,
                  gradientColors: gradientColors,
                ),
              ),
              // 말풍선
              Positioned(
                left: sliderPosition +
                    15 +
                    (width - 60) / 5 / 2 -
                    (valueLabelWidth / 2 + 7),
                top: 0,
                child: _SpeachBubble(valueLabel: valueLabel),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 배경바
class _BackgroundBar extends StatelessWidget {
  const _BackgroundBar({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xFFE5E5EA),
      ),
    );
  }
}

// 수치 최대, 최소 라벨
class _ValueLabel extends StatelessWidget {
  const _ValueLabel({
    required this.minLabel,
    required this.maxLabel,
    required this.width,
  });

  final String minLabel;
  final String maxLabel;
  final double width;

  @override
  Widget build(BuildContext context) {
    const TextStyle labelTextStyle = TextStyle(
      color: Color(0xFF3A3A3C),
      fontSize: 9,
      fontWeight: FontWeight.w400,
    );

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 최소수치 라벨
          Text(minLabel, style: labelTextStyle),
          const SizedBox(height: 3.0),
          // 최소수치 라벨
          Text(maxLabel, style: labelTextStyle),
        ],
      ),
    );
  }
}

// 수치바
class _ValueBar extends StatelessWidget {
  const _ValueBar({required this.gradientColors, required this.width});

  final List<Color> gradientColors;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 10,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-1.00, 0.00),
          end: const Alignment(1, 0),
          colors: gradientColors,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21.60),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 1.80,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}

// 말풍선
class _SpeachBubble extends StatelessWidget {
  const _SpeachBubble({required this.valueLabel});

  final String valueLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 4.0),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F6FA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.50),
            ),
          ),
          child: Text(
            valueLabel,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.blue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -3.0) // 약간 위로 이동
            ..rotateZ(3.14), // 180도 회전 (라디안 단위)
          alignment: Alignment.center,
          child: Container(
            width: 11.70,
            height: 11.70,
            decoration: const ShapeDecoration(
              color: Color(0xFFF4F6FA),
              shape: StarBorder.polygon(
                sides: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
