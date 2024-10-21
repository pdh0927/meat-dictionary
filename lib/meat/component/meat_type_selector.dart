import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 고기 타입 선택 컴포넌트
class MeatTypeSelector extends StatelessWidget {
  final MeatType selectedType;
  final ValueChanged<MeatType> onTypeChanged;

  const MeatTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _MeatTypeButton(
            type: MeatType.pork,
            assetPath: 'assets/imgs/common/pig_face.png',
            label: '돼지고기',
            isSelected: selectedType == MeatType.pork,
            onTap: () => onTypeChanged(MeatType.pork),
          ),
          const SizedBox(width: 40.0),
          _MeatTypeButton(
            type: MeatType.beef,
            assetPath: 'assets/imgs/common/cow_face.png',
            label: '소고기',
            isSelected: selectedType == MeatType.beef,
            onTap: () => onTypeChanged(MeatType.beef),
          ),
        ],
      ),
    );
  }
}

// 고기 타입 버튼 컴포넌트
class _MeatTypeButton extends StatelessWidget {
  final MeatType type;
  final String assetPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MeatTypeButton({
    required this.type,
    required this.assetPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected ? PRIMARY_COLOR : const Color(0xFFE4E4E4),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
              width: 35,
              height: 35,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: isSelected ? PRIMARY_COLOR : const Color(0xFF8E8E8E),
            ),
          ),
        ],
      ),
    );
  }
}
