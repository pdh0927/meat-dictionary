import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/provider/shared_preferences_provider.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<int>>((ref) {
  return FavoritesNotifier(ref);
});

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier(this.ref) : super({}) {
    _loadFavorites();
  }

  final Ref ref;

  Future<void> _loadFavorites() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final porkFavorites = prefs.getStringList('pork_favorites') ?? [];
    state = porkFavorites.map((id) => int.parse(id)).toSet();
  }

  Future<void> toggleFavorite(int id, String type) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final key = '${type}_favorites';
    final List<String> favorites = prefs.getStringList(key) ?? [];

    if (state.contains(id)) {
      favorites.remove(id.toString());
      state = {...state}..remove(id);
    } else {
      favorites.add(id.toString());
      state = {...state}..add(id);
    }

    await prefs.setStringList(key, favorites);
  }
}
