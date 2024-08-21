import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

class MeatMenu extends StatelessWidget {
  final MeatType selectedType;
  final ValueChanged<MeatType> onTypeChanged;

  const MeatMenu({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TitleBox(
          title: '돼지',
          isSelect: selectedType == MeatType.pork,
          onTap: () => onTypeChanged(MeatType.pork),
        ),
        const SizedBox(width: 8.0),
        _TitleBox(
          title: '소',
          isSelect: selectedType == MeatType.beef,
          onTap: () => onTypeChanged(MeatType.beef),
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
