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
      leading: widget.isTap
          ? null
          : InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                PhosphorIcons.caretLeft(),
                size: 25,
                color: BLACK_COLOR,
              ),
            ),
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
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedMeatType = MeatType.pork;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selectedMeatType == MeatType.pork
                              ? PRIMARY_COLOR
                              : const Color(0xFFE4E4E4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/imgs/common/pig_face.png',
                          fit: BoxFit.fill,
                          width: 35,
                          height: 35,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '돼지고기',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: selectedMeatType == MeatType.pork
                              ? PRIMARY_COLOR
                              : const Color(0xFF8E8E8E),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 40.0),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedMeatType = MeatType.beef;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selectedMeatType == MeatType.beef
                              ? PRIMARY_COLOR
                              : const Color(0xFFE4E4E4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          'assets/imgs/common/cow_face.png',
                          fit: BoxFit.fill,
                          width: 35,
                          height: 35,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '소고기',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: selectedMeatType == MeatType.beef
                              ? PRIMARY_COLOR
                              : const Color(0xFF8E8E8E),
                        ),
                      )
                    ],
                  ),
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
}
