import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 고기 리스트 화면
class MeatListScreen extends StatefulWidget {
  const MeatListScreen({
    super.key,
    required this.meatType,
    this.isTap = true,
  });

  final MeatType meatType;
  final bool isTap;

  @override
  State createState() => _MeatListScreenState();
}

class _MeatListScreenState extends State<MeatListScreen> {
  late MeatType selectedMeatType;

  @override
  void initState() {
    super.initState();
    selectedMeatType = widget.meatType; // 초기값 설정
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '육식도감',
      leading: _buildLeadingButton(), // 뒤로 가기 버튼
      child: Column(
        children: [
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color(0xFFE4E4E4),
          ),
          const SizedBox(height: 13.0),

          // 돼지고기/소고기 선택 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _MeatTypeButton(
                  type: MeatType.pork,
                  assetPath: 'assets/imgs/common/pig_face.png',
                  label: '돼지고기',
                  isSelected: selectedMeatType == MeatType.pork,
                  onTap: () => _selectMeatType(MeatType.pork),
                ),
                const SizedBox(width: 40.0),
                _MeatTypeButton(
                  type: MeatType.beef,
                  assetPath: 'assets/imgs/common/cow_face.png',
                  label: '소고기',
                  isSelected: selectedMeatType == MeatType.beef,
                  onTap: () => _selectMeatType(MeatType.beef),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0),

          // 고기 리스트 표시
          Expanded(
            child: MeatList(
              isFavoritesScreen: false,
              meatType: selectedMeatType,
              filterData: null,
            ),
          ),
        ],
      ),
    );
  }

  // 고기 타입 선택 시 상태 갱신
  void _selectMeatType(MeatType type) {
    setState(() {
      selectedMeatType = type;
    });
  }

  // 뒤로 가기 버튼 빌드
  Widget? _buildLeadingButton() {
    if (widget.isTap) return null;
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(
        PhosphorIcons.caretLeft(),
        size: 25,
        color: BLACK_COLOR,
      ),
    );
  }
}

class _MeatTypeButton extends StatelessWidget {
  final MeatType type;
  final String assetPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MeatTypeButton({
    super.key,
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
              fit: BoxFit.fill,
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
