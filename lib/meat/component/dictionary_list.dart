import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/meat/component/dictionary_list_component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

class DictionaryList extends ConsumerWidget {
  final bool isFavoritesScreen;
  final MeatType meatType;

  const DictionaryList({
    super.key,
    required this.isFavoritesScreen,
    required this.meatType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMap = ref.watch(favoritesProvider);
    final favoriteIds = favoriteMap[meatType] ?? {};
    final selectedList = meatType == MeatType.pork ? porkList : beefList;

    // 즐겨찾기 화면인 경우 즐겨찾기 항목만 필터링
    final filteredList = isFavoritesScreen
        ? selectedList
            .where((meat) =>
                favoriteIds.contains(meat.id) && meat.type == meatType)
            .toList()
        : selectedList;

    return Column(
      children: filteredList.map((meat) {
        final isSelected =
            ref.read(favoritesProvider.notifier).isFavorite(meat.type, meat.id);
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              child: InkWell(
                onTap: () {
                  context.pushNamed("meat_detail");
                },
                child: DictionaryListComponent(
                  meatModel: meat,
                  isSelected: isSelected,
                ),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 2.0,
              color: Color(0xFFF4F6FA),
            )
          ],
        );
      }).toList(),
    );
  }
}
