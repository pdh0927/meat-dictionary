import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/component/meat_type_selector.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

// 즐겨찾기 화면

class FavoritesScreen extends ConsumerStatefulWidget {
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
          const SizedBox(height: 10.0),

          // 고기 선택 버튼
          Center(
            child: MeatTypeSelector(
              selectedType: selectedType,
              onTypeChanged: _onTypeChanged,
            ),
          ),

          const SizedBox(height: 15.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '전체 ${ref.watch(favoritesProvider)[selectedType]!.length}개',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 8.0),

          // 고기 리스트
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
