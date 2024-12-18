import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/common/provider/shared_preferences_provider.dart';
import 'package:meat_dictionary/meat/const/meat_detail_sceen_data.dart';
import 'package:meat_dictionary/meat/const/meat_model_data.dart';
import 'package:meat_dictionary/meat/model/meat_identifier.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

// 검색 화면
class CustomSearchScreen extends ConsumerStatefulWidget {
  const CustomSearchScreen({super.key});

  @override
  ConsumerState createState() => _CustomSearchScreenState();
}

// 검색 화면의 상태를 관리하는 클래스
class _CustomSearchScreenState extends ConsumerState<CustomSearchScreen> {
  // 검색어 입력을 관리하는 컨트롤러
  final TextEditingController _searchController = TextEditingController();

  // 전체 고기 데이터
  List<MeatModel> allMeats = [];

  // 검색 결과
  List<MeatModel> searchResults = [];

  // 최근 검색어
  List<MeatIdentifier> recentSearches = [];

  // 인기 검색어
  List<MeatIdentifier> popularSearches = [
    MeatIdentifier(MeatType.pork, '목살'),
    MeatIdentifier(MeatType.pork, '삼겹살'),
    MeatIdentifier(MeatType.beef, '등심'),
    MeatIdentifier(MeatType.pork, '앞다리살'),
    MeatIdentifier(MeatType.beef, '갈비'),
    MeatIdentifier(MeatType.pork, '갈매기살'),
    MeatIdentifier(MeatType.beef, '안심'),
  ];

  // 인기 검색어와 최근 검색어 탭 상태를 관리
  bool isPopularSelected = false;

  @override
  void initState() {
    super.initState();
    allMeats = porkList + beefList; // 전체 고기 데이터를 로드
    _loadRecentSearches(); // 최근 검색어를 로드
  }

  // MeatIdentifier를 기반으로 MeatModel을 찾는 메서드
  MeatModel _findMeatModel(MeatIdentifier identifier) {
    return allMeats.firstWhere(
      (meat) => meat.type == identifier.type && meat.name == identifier.name,
    );
  }

  // SharedPreferences에서 최근 검색어를 로드하는 메서드
  Future<void> _loadRecentSearches() async {
    final prefs = ref.read(sharedPreferencesProvider);
    List<String> recentSearchStrings =
        prefs.getStringList('recentSearches') ?? [];

    setState(() {
      // JSON 문자열을 MeatIdentifier 객체로 변환하여 대입
      recentSearches = recentSearchStrings.map((jsonString) {
        final jsonMap = jsonDecode(jsonString);

        return MeatIdentifier.fromJson(jsonMap);
      }).toList();
    });
  }

  // 검색어를 최근 검색어 목록에 추가하는 메서드
  Future<void> _addRecentSearch(MeatModel meatModel) async {
    final prefs = ref.read(sharedPreferencesProvider);

    // 'recentSearches' 키로 저장된 최근 검색어 목록을 불러옴
    List<String> updatedRecentSearches =
        prefs.getStringList('recentSearches') ?? [];

    final identifier = MeatIdentifier(meatModel.type, meatModel.name);
    final identifierJson = identifier.toJson();

    // 추가할 검색어를 JSON 문자열로 변환하여 저장
    final identifierString = jsonEncode(identifierJson);

    // 중복 제거
    updatedRecentSearches.remove(identifierString);
    updatedRecentSearches.insert(0, identifierString);

    // 최대 7개의 최근 검색어만 유지
    if (updatedRecentSearches.length > 7) {
      updatedRecentSearches = updatedRecentSearches.take(7).toList();
    }

    await prefs.setStringList('recentSearches', updatedRecentSearches);

    // JSON 문자열을 다시 MeatIdentifier로 변환하여 상태 업데이트
    setState(() {
      recentSearches = updatedRecentSearches
          .map((jsonString) => MeatIdentifier.fromJson(jsonDecode(jsonString)))
          .toList();
    });
  }

  // 특정 검색어를 최근 검색어 목록에서 제거하는 메서드
  Future<void> _removeRecentSearch(MeatIdentifier identifier) async {
    final prefs = ref.read(sharedPreferencesProvider);

    // 'recentSearches' 키로 저장된 최근 검색어 목록을 불러옴
    List<String> updatedRecentSearches =
        prefs.getStringList('recentSearches') ?? [];

    // 제거할 검색어를 JSON 형식의 문자열로 변환
    final identifierString = jsonEncode(identifier.toJson());

    // 해당 문자열을 최근 검색어 목록에서 제거
    updatedRecentSearches.remove(identifierString);

    // 변경된 목록을 SharedPreferences에 다시 저장
    await prefs.setStringList('recentSearches', updatedRecentSearches);

    // 저장된 JSON 문자열을 다시 MeatIdentifier 객체로 변환하여 목록 생성
    setState(() {
      recentSearches = updatedRecentSearches.map((jsonString) {
        final jsonMap = jsonDecode(jsonString);
        return MeatIdentifier.fromJson(jsonMap);
      }).toList();
    });
  }

  // 검색어에 따라 검색 결과를 필터링하는 메서드
  void _search(String query) {
    setState(() {
      // 모든 고기 목록에서 검색어(query)가 포함된 항목만 필터링
      searchResults = allMeats
          .where(
              (meat) => meat.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '검색',
      child: Column(
        children: [
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color(0xFFE4E4E4),
          ),
          const SizedBox(height: 24.0),

          // 검색어 입력 bar
          _SearchBar(
            searchController: _searchController,
            onChanged: _search,
            onClear: () {
              _searchController.clear(); // 검색어 초기화
              _search(''); // 검색 결과 초기화
              setState(() {}); // UI 갱신
            },
          ),

          const SizedBox(height: 16.0),

          if (_searchController.text.isEmpty)
            // 검색어 입력이 없을 때

            // 최근, 인기 검색어 탭
            _SearchTabs(
              isPopularSelected: isPopularSelected,
              onTabSelected: (selected) {
                setState(() {
                  isPopularSelected = selected;
                });
              },
              recentSearches: recentSearches,
              popularSearches: popularSearches,
              onRemoveRecent: _removeRecentSearch,
              onSearchSelected: (meatIdentifier) {
                _searchController.text = meatIdentifier.name;
                _search(meatIdentifier.name);
              },
              findMeatModel: _findMeatModel,
            )
          else
            // 검색어 입력이 있을 때

            // 검색 결과
            _SearchResults(
              searchResults: searchResults,
              onResultSelected: (meatModel) async {
                await _addRecentSearch(meatModel); // 검색 결과를 최근 검색어에 추가

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getMeatDetailScreen(meatModel),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

// 검색어 입력 bar
class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.searchController,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 검색 입력 필드
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: searchController,
              cursorHeight: 18.0,
              decoration: InputDecoration(
                hintText: '부위별 검색하기',
                prefixIcon: Icon(
                  PhosphorIcons.magnifyingGlass(),
                  size: 24,
                  color: const Color(0xFF8E8E8E),
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          PhosphorIconsFill.xCircle,
                          size: 25,
                          color: Color(0xFFE4E4E4),
                        ),
                        onPressed: onClear, // 검색어 지우기
                      )
                    : null,
                contentPadding: const EdgeInsets.only(top: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(color: Color(0xFFD8D8D8)),
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

// 검색 결과 목록을 표시하는 위젯
class _SearchResults extends StatelessWidget {
  const _SearchResults({
    required this.searchResults,
    required this.onResultSelected,
  });

  final List<MeatModel> searchResults;
  final ValueChanged<MeatModel> onResultSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            final meat = searchResults[index];
            final meatType = meat.type == MeatType.pork ? '돼지' : '소';
            final displayText = '$meatType  >  ${meat.name}';

            return ListTile(
              title: Text(
                displayText,
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              onTap: () => onResultSelected(meat),
            );
          },
        ),
      ),
    );
  }
}

// 인기 검색어와 최근 검색어 선택 탭
class _SearchTabs extends StatelessWidget {
  const _SearchTabs({
    required this.isPopularSelected,
    required this.onTabSelected,
    required this.recentSearches,
    required this.popularSearches,
    required this.onRemoveRecent,
    required this.onSearchSelected,
    required this.findMeatModel,
  });

  final bool isPopularSelected;
  final ValueChanged<bool> onTabSelected;
  final List<MeatIdentifier> recentSearches;
  final List<MeatIdentifier> popularSearches;
  final ValueChanged<MeatIdentifier> onRemoveRecent;
  final ValueChanged<MeatIdentifier> onSearchSelected;
  final MeatModel Function(MeatIdentifier) findMeatModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 인기 검색어와 최근 검색어 탭
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SearchMenuComponent(
              label: '최근 검색어',
              isSelected: !isPopularSelected,
              onTap: () => onTabSelected(false),
            ),
            _SearchMenuComponent(
              label: '인기 검색어',
              isSelected: isPopularSelected,
              onTap: () => onTabSelected(true),
            ),
          ],
        ),
        const SizedBox(height: 5.0),

        // 탭에 따른 검색어 목록 표시
        // 최근 검색어
        if (!isPopularSelected)
          ...recentSearches.map(
            (meatIdentifier) => ListTile(
              leading: Icon(
                PhosphorIcons.clockCounterClockwise(),
                size: 23,
              ),
              title: Text(
                '${meatIdentifier.type == MeatType.pork ? '돼지' : '소'}  >  ${meatIdentifier.name}',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  PhosphorIcons.x(),
                  size: 23,
                ),
                onPressed: () => onRemoveRecent(meatIdentifier),
              ),
              onTap: () {
                final meatModel = findMeatModel(meatIdentifier);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getMeatDetailScreen(meatModel),
                  ),
                );
              },
            ),
          ),
        // 인기 검색어
        if (isPopularSelected)
          ...popularSearches.asMap().entries.map(
            (entry) {
              final index = entry.key; // 인덱스
              final meatIdentifier = entry.value;

              return ListTile(
                dense: true,
                title: Text(
                  '${index + 1}.   ${meatIdentifier.type == MeatType.pork ? '돼지' : '소'}  >  ${meatIdentifier.name}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: index <= 2 ? FontWeight.w600 : FontWeight.w400,
                    color: index <= 2 ? PRIMARY_COLOR : Colors.black,
                  ),
                ),
                onTap: () {
                  final meatModel = findMeatModel(meatIdentifier);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getMeatDetailScreen(meatModel),
                    ),
                  );
                },
              );
            },
          ),
      ],
    );
  }
}

// 탭 메뉴 위젯
class _SearchMenuComponent extends StatelessWidget {
  const _SearchMenuComponent({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 50.w,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? PRIMARY_COLOR : const Color(0xFFE4E4E4),
              width: 2.0,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? PRIMARY_COLOR : const Color(0xFF8E8E8E),
          ),
        ),
      ),
    );
  }
}
