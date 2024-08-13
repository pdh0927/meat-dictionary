import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/provider/shared_preferences_provider.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

class MeatSearchDelegate extends SearchDelegate<String> {
  final List<MeatModel> allMeats = porkList + beefList;
  final WidgetRef ref;

  MeatSearchDelegate({required this.ref});

  // SharedPreferences에서 최근 검색어 목록을 로드
  Future<List<String>> _loadRecentSearches() async {
    final prefs = ref.read(sharedPreferencesProvider);
    return prefs.getStringList('recentSearches') ?? [];
  }

  // SharedPreferences에 최근 검색어 추가
  Future<void> _addRecentSearch(String query) async {
    final prefs = ref.read(sharedPreferencesProvider);
    List<String> recentSearches = prefs.getStringList('recentSearches') ?? [];

    if (recentSearches.contains(query)) {
      recentSearches.remove(query);
    }
    recentSearches.insert(0, query);

    if (recentSearches.length > 5) {
      recentSearches = recentSearches.take(5).toList();
    }

    await prefs.setStringList('recentSearches', recentSearches);
  }

  // SharedPreferences에서 모든 최근 검색어 삭제
  Future<void> _clearRecentSearches() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove('recentSearches');
  }

  // SharedPreferences에서 특정 최근 검색어 삭제
  Future<void> _removeRecentSearch(String query) async {
    final prefs = ref.read(sharedPreferencesProvider);
    List<String> recentSearches = prefs.getStringList('recentSearches') ?? [];

    recentSearches.remove(query);
    await prefs.setStringList('recentSearches', recentSearches);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : Container(),
      TextButton(
        onPressed: () {
          close(context, '');
        },
        child: Text(
          '취소',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(); // leading 버튼을 빈 컨테이너로 대체하여 없앰
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = allMeats.where((meat) {
      return meat.name.contains(query);
    }).toList();

    return Container(
      color: Colors.white, // 배경색 흰색
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final meat = results[index];
          final meatType = meat.type == 'pork' ? '돼지' : '소';
          final displayText = '$meatType > ${meat.name}';

          return ListTile(
            leading: Icon(Icons.search),
            title: RichText(
              text: TextSpan(
                text: displayText.substring(0, displayText.indexOf(query)),
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: query,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  TextSpan(
                    text: displayText
                        .substring(displayText.indexOf(query) + query.length),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            onTap: () async {
              await _addRecentSearch(displayText); // 최근 검색어 추가
              close(context, displayText);
              // detailPage로 이동하는 로직 추가
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _loadRecentSearches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final recentSearches = snapshot.data ?? [];
        final suggestions = query.isEmpty
            ? recentSearches
            : allMeats.where((meat) => meat.name.contains(query)).toList();

        return Container(
          color: Colors.white, // 배경색 흰색
          child: Column(
            children: [
              if (query.isEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('최근 검색',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () async {
                          await _clearRecentSearches(); // 최근 검색어 전체 삭제
                          showSuggestions(context);
                        },
                        child: Text('전체삭제'),
                      ),
                    ],
                  ),
                ),
              ],
              Expanded(
                child: ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = suggestions[index];
                    String displayText;

                    if (suggestion is String) {
                      displayText = suggestion;
                    } else if (suggestion is MeatModel) {
                      displayText =
                          '${suggestion.type == 'pork' ? '돼지' : '소'} > ${suggestion.name}';
                    } else {
                      displayText = '';
                    }

                    return ListTile(
                      leading: Icon(Icons.search),
                      title: Text(displayText),
                      trailing: query.isEmpty
                          ? IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () async {
                                await _removeRecentSearch(
                                    displayText); // 최근 검색어 개별 삭제
                                showSuggestions(context);
                              },
                            )
                          : null,
                      onTap: () {
                        query = displayText;
                        showResults(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
