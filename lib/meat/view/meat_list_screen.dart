import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/component/meat_type_selector.dart';
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
          MeatTypeSelector(
            selectedType: selectedMeatType,
            onTypeChanged: _onTypeChanged,
          ),

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
  void _onTypeChanged(MeatType type) {
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
