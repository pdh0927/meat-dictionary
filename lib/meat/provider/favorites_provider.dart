import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/provider/shared_preferences_provider.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

// 즐겨찾기 상태를 관리하는 StateNotifierProvider
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Map<MeatType, Set<int>>>((ref) {
  return FavoritesNotifier(ref);
});

class FavoritesNotifier extends StateNotifier<Map<MeatType, Set<int>>> {
  FavoritesNotifier(this.ref) : super({}) {
    _loadAllFavorites();
  }

  final Ref ref;

  Future<void> _loadAllFavorites() async {
    final prefs = ref.read(sharedPreferencesProvider);
    state = {
      MeatType.pork: (prefs.getStringList('pork_favorites') ?? [])
          .map((id) => int.parse(id))
          .toSet(),
      MeatType.beef: (prefs.getStringList('beef_favorites') ?? [])
          .map((id) => int.parse(id))
          .toSet(),
      // 필요한 다른 타입도 여기에 추가
    };
  }

  Future<void> toggleFavorite(MeatType type, int id) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final key = '${type.label}_favorites';
    final currentFavorites = (prefs.getStringList(key) ?? []).toSet();

    if (state[type]?.contains(id) ?? false) {
      currentFavorites.remove(id.toString());
      state = {
        ...state,
        type: {...state[type]!}..remove(id),
      };
    } else {
      currentFavorites.add(id.toString());
      state = {
        ...state,
        type: {...state[type] ?? {}, id},
      };
    }

    await prefs.setStringList(key, currentFavorites.toList());
  }

  bool isFavorite(MeatType type, int id) {
    return state[type]?.contains(id) ?? false;
  }
}
