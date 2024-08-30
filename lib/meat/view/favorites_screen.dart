import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/component/two_menu.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

// 즐겨찾기 화면
class FavoritesScreen extends ConsumerStatefulWidget {
  static String get routeName => 'favorites';

  const FavoritesScreen({super.key});

  @override
  ConsumerState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  MeatType selectedType = MeatType.pork; // 기본값을 돼지로 설정

  void _onTypeChanged(MeatType type) {
    setState(() {
      selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "즐겨찾기 목록",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 고기 type 선택 버튼
          TwoMenu(
            selectIndex: selectedType == MeatType.pork ? 0 : 1,
            onLeftTap: () => _onTypeChanged(MeatType.pork),
            onRightTap: () => _onTypeChanged(MeatType.beef),
            leftLabel: '돼지',
            rightLabel: '소',
          ),
          const SizedBox(height: 10.0),
          // 전체 개수
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '전체 ${ref.read(favoritesProvider)[selectedType]!.length}개',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          // 즐겨찾기 고기 목록
          Expanded(
            child: MeatList(
              isFavoritesScreen: true,
              meatType: selectedType,
            ),
          ),
        ],
      ),
    );
  }
}
