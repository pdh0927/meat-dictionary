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
          title: '식감',
          minLabel: '부드러움',
          maxLabel: '쫄깃함',
          valueLabel: meatModel.texture.label,
          sliderPosition: meatModel.texture.sliderValue * 70.w,
          gradientColors: const [
            Color(0xFFFF0D00),
            Color(0xFFFF0D00),
            Color(0xFFFF0072),
          ],
          width: 70.w,
        ),
        const SizedBox(height: 12),
        // 지방 수치
        _AttributeBar(
          title: '지방',
          minLabel: '적음',
          maxLabel: '많음',
          valueLabel: meatModel.savoryFlavor.label,
          sliderPosition: meatModel.savoryFlavor.sliderValue * 70.w,
          gradientColors: const [
            Color(0xFF9DF200),
            Color(0xFF44C400),
            Color(0xFF0093B4),
          ],
          width: 70.w,
        ),
        const SizedBox(height: 12),
        // 육향 수치
        _AttributeBar(
          title: '육향',
          minLabel: '적음',
          maxLabel: '많음',
          valueLabel: meatModel.meatAroma.label,
          sliderPosition: meatModel.meatAroma.sliderValue * 70.w,
          gradientColors: const [
            Color(0xFF007BFE),
            Color(0xFF5856D6),
            Color(0xFFAF52DE),
          ],
          width: 70.w,
        ),
      ],
    );
  }
}

// 속성바
class _AttributeBar extends StatelessWidget {
  const _AttributeBar({
    required this.title,
    required this.minLabel,
    required this.maxLabel,
    required this.valueLabel,
    required this.sliderPosition,
    required this.gradientColors,
    required this.width,
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
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 속성 이름
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              // 배경바
              _BackgroundBar(width: width, height: 10),
              // 수치 최대, 최소 라벨
              _ValueLabel(minLabel: minLabel, maxLabel: maxLabel)
            ],
          ),
          // 수치바
          Positioned(
            left: sliderPosition,
            top: 31,
            child: _ValueBar(gradientColors: gradientColors),
          ),
          // 말풍선
          Positioned(
            left: sliderPosition,
            top: 8,
            child: _SpeachBubble(valueLabel: valueLabel),
          ),
        ],
      ),
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
  });

  final String minLabel;
  final String maxLabel;

  @override
  Widget build(BuildContext context) {
    const TextStyle labelTextStyle = TextStyle(
      color: Color(0xFF3A3A3C),
      fontSize: 9,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w400,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 최소수치 라벨
        Text(minLabel, style: labelTextStyle),
        const SizedBox(height: 3.0),
        // 최소수치 라벨
        Text(maxLabel, style: labelTextStyle),
      ],
    );
  }
}

// 수치바
class _ValueBar extends StatelessWidget {
  const _ValueBar({required this.gradientColors});

  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w / 5,
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
          width: 70.w / 4.5,
          height: 20,
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
              fontSize: 10.8,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
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
