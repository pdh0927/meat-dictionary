import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/meat/component/dictionary_list_component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

class DictionaryList extends ConsumerWidget {
  final bool isFavoritesScreen;

  const DictionaryList({super.key, required this.isFavoritesScreen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritesProvider);

    // 즐겨찾기 화면인 경우 즐겨찾기 항목만 필터링
    final favoritesList = isFavoritesScreen
        ? porkList.where((meat) => favoriteIds.contains(meat.id)).toList()
        : porkList;

    return ListView.builder(
      itemCount: favoritesList.length,
      itemBuilder: (context, index) {
        final meat = favoritesList[index];
        final isSelected =
            isFavoritesScreen ? true : favoriteIds.contains(meat.id);

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
