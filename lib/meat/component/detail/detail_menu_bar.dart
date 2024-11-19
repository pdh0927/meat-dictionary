import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:sizer/sizer.dart';

// 디테일 페이지 스크롤 이동 메뉴
class DetailMenuBar extends StatelessWidget {
  const DetailMenuBar({
    super.key,
    required this.names,
    required this.offsets,
    required this.onMenuSelected,
  });

  final List<String> names;
  final List<double> offsets;
  final Function(double) onMenuSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(names.length * 2 - 1, (index) {
          if (index.isOdd) {
            // 버튼 사이에 여백 추가
            return const SizedBox(width: 4.0); // 버튼 사이의 간격
          } else {
            // 버튼 생성
            int buttonIndex = index ~/ 2;
            return _MenuButton(
              width: (100.w - (names.length - 1) * 4 - 30) /
                  names.length, // 간격 포함한 버튼 너비
              name: names[buttonIndex],
              onTap: () => onMenuSelected(offsets[buttonIndex]),
            );
          }
        }),
      ),
    );
  }
}

// 메뉴 버튼
class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.width,
    required this.name,
    required this.onTap,
  });

  final double width;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 28,
        width: width,
        decoration: const BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
