import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';

class TwoMenu extends StatelessWidget {
  final int selectIndex;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;
  final String leftLabel;
  final String rightLabel;

  const TwoMenu({
    super.key,
    required this.selectIndex,
    required this.onLeftTap,
    required this.onRightTap,
    required this.leftLabel,
    required this.rightLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TitleBox(
          title: leftLabel,
          isSelect: selectIndex == 0,
          onTap: onLeftTap,
        ),
        const SizedBox(width: 8.0),
        _TitleBox(
          title: rightLabel,
          isSelect: selectIndex == 1,
          onTap: onRightTap,
        ),
      ],
    );
  }
}

class _TitleBox extends StatelessWidget {
  final String title;
  final bool isSelect;
  final VoidCallback onTap;

  const _TitleBox({
    required this.title,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelect ? BLACK_COLOR : Colors.transparent,
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelect ? BLACK_COLOR : GREY_COLOR,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
