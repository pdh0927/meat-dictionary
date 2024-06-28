import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/provider/shared_preferences_provider.dart';

class FavoritesNotifier extends StateNotifier<Map<String, Set<int>>> {
  FavoritesNotifier(this.ref) : super({}) {
    _loadAllFavorites();
  }

  final Ref ref;

  Future<void> _loadAllFavorites() async {
    final prefs = ref.read(sharedPreferencesProvider);
    state = {
      'pork': (prefs.getStringList('pork_favorites') ?? [])
          .map((id) => int.parse(id))
          .toSet(),
      'beef': (prefs.getStringList('beef_favorites') ?? [])
          .map((id) => int.parse(id))
          .toSet(),
      // 필요한 다른 타입도 여기에 추가
    };
  }

  Future<void> toggleFavorite(String type, int id) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final key = '${type}_favorites';
    final favorites = (prefs.getStringList(key) ?? []).toSet();

    if (state[type]?.contains(id) ?? false) {
      favorites.remove(id.toString());
      state = {
        ...state,
        type: {...state[type] ?? {}, id}..remove(id),
      };
    } else {
      favorites.add(id.toString());
      state = {
        ...state,
        type: {...state[type] ?? {}, id},
      };
    }

    await prefs.setStringList(key, favorites.toList());
  }
}

// 즐겨찾기 상태를 관리하는 StateNotifierProvider
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Map<String, Set<int>>>((ref) {
  return FavoritesNotifier(ref);
});
