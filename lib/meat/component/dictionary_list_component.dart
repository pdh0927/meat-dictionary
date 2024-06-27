import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:sizer/sizer.dart';

class DictionaryListComponent extends StatelessWidget {
  final MeatModel meatModel;
  final bool isSelected;

  const DictionaryListComponent({
    super.key,
    required this.meatModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            meatModel.imgPath,
            height: 20.w,
            width: 20.w,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    meatModel.name,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 14,
                      color: BLACK_COLOR,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    meatModel.usage.join(', '),
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 12,
                      color: GREY_COLOR,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      isSelected
                          ? 'assets/icons/icon_bookmark_on_20.svg'
                          : 'assets/icons/icon_bookmark_off_20.svg',
                      color: isSelected ? const Color(0XFFFFA928) : GREY_COLOR,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                meatModel.description,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 12,
                  color: BLACK_COLOR,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  OvalLabel(
                    label: '식감',
                    value: meatModel.texture,
                    isSelected: true,
                  ),
                  const SizedBox(width: 4),
                  OvalLabel(
                    label: '고소함',
                    value: meatModel.savoryFlavor,
                    isSelected: false,
                  ),
                  const SizedBox(width: 4),
                  OvalLabel(
                    label: '육향',
                    value: meatModel.meatAroma,
                    isSelected: false,
                  ),
                  const SizedBox(width: 4),
                  OvalLabel(
                    label: '가격',
                    value: meatModel.price,
                    isSelected: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OvalLabel extends StatelessWidget {
  final String label;
  final double value;
  final bool isSelected;

  const OvalLabel({
    super.key,
    required this.label,
    required this.value,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0XFFFFF6F6) : const Color(0XFFF3F4F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 12,
              color: isSelected ? PRIMARY_COLOR : const Color(0XFF5B5D6B),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value.toString(),
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 12,
              color: isSelected ? PRIMARY_COLOR : const Color(0XFF5B5D6B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}