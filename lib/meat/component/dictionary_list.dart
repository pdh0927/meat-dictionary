import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/meat/component/dictionary_list_component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

class DictionaryList extends ConsumerWidget {
  final bool isFavoritesScreen;
  final String? type;

  const DictionaryList({
    super.key,
    required this.isFavoritesScreen,
    this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMap = ref.watch(favoritesProvider);
    final favoriteIds = favoriteMap[type] ?? {};
    final selectedList = type == 'pork' ? porkList : beefList;

    // 즐겨찾기 화면인 경우 즐겨찾기 항목만 필터링
    final filteredList = isFavoritesScreen
        ? selectedList
            .where((meat) =>
                favoriteIds.contains(meat.id) &&
                (type == null || meat.type == type))
            .toList()
        : selectedList;

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final meat = filteredList[index];
        final isSelected = favoriteIds.contains(meat.id);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              context.pushNamed("meat_detail");
            },
            child: DictionaryListComponent(
              meatModel: meat,
              isSelected: isSelected,
            ),
          ),
        );
      },
    );
  }
}
