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

  // SharedPreferences에서 즐겨찾기 데이터를 불러오는 함수
  Future<void> _loadAllFavorites() async {
    final prefs = ref.read(sharedPreferencesProvider);

    state = {
      MeatType.pork: (prefs.getStringList('pork_favorites') ?? [])
          .map((id) => int.parse(id))
          .toSet(),
      MeatType.beef: (prefs.getStringList('beef_favorites') ?? [])
          .map((id) => int.parse(id))
          .toSet(),
    };
  }

  // 즐겨찾기 상태를 토글하는 함수 (추가/삭제)
  Future<void> toggleFavorite(MeatType type, int id) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final key = '${type.label}_favorites';
    final currentFavorites = (prefs.getStringList(key) ?? []).toSet();

    if (state[type]?.contains(id) ?? false) {
      // 이미 즐겨찾기에 존재하는 경우 삭제
      currentFavorites.remove(id.toString());
      state = {
        ...state,
        type: {...state[type]!}..remove(id),
      };
    } else {
      // 즐겨찾기에 없는 경우 추가
      currentFavorites.add(id.toString());
      state = {
        ...state,
        type: {...state[type] ?? {}, id},
      };
    }

    await prefs.setStringList(key, currentFavorites.toList());
  }

  // 해당 고기가 즐겨찾기에 있는지 확인하는 함수
  bool isFavorite(MeatType type, int id) {
    return state[type]?.contains(id) ?? false;
  }
}
