import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/component/detail/meat_attributes.dart';
import 'package:meat_dictionary/meat/component/detail/meat_usages.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 고기 프로필
class MeatProfile extends StatelessWidget {
  const MeatProfile({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 이미지
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Image.asset(
            meatModel.imgPath,
          ),
        ),
        const SizedBox(height: 30.0),
        // 고기 한마디
        Text(
          meatModel.description,
          style: const TextStyle(
            color: Color(0xFFFF0000),
            fontFamily: "Pretend",
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6.0),
        // 고기 이름
        Text(
          meatModel.name,
          style: const TextStyle(
            color: BLACK_COLOR,
            fontFamily: "Pretend",
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6.0),
        // 고기 용도
        MeatUsages(usages: meatModel.usage),
        const SizedBox(height: 25.0),
        // 고기 속성 수치
        MeatAttributes(meatModel: meatModel),
      ],
    );
  }
}
