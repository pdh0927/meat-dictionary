import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/dictionary_list.dart';
import 'package:meat_dictionary/meat/component/meat_menu.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

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
          MeatMenu(
            selectedType: selectedType,
            onTypeChanged: _onTypeChanged,
          ),
          const SizedBox(height: 10.0),
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
          Expanded(
            child: DictionaryList(
              isFavoritesScreen: true,
              meatType: selectedType,
            ),
          ),
        ],
      ),
    );
  }
}
