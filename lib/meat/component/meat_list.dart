import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/meat/component/meat_list_component.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/const/dummy_data.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';

class MeatList extends ConsumerWidget {
  final bool isFavoritesScreen;
  final MeatType meatType;
  final Map<String, dynamic>? filterData;

  const MeatList({
    super.key,
    required this.isFavoritesScreen,
    required this.meatType,
    this.filterData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMap = ref.watch(favoritesProvider);
    final favoriteIds = favoriteMap[meatType] ?? {};
    List<MeatModel> selectedList =
        meatType == MeatType.pork ? porkList : beefList;

    // 필터 적용
    if (filterData != null) {
      selectedList = _filterAndSortMeatList(selectedList, filterData!);
    }

    // 즐겨찾기 화면인 경우 필터링
    if (isFavoritesScreen) {
      selectedList = selectedList
          .where(
              (meat) => favoriteIds.contains(meat.id) && meat.type == meatType)
          .toList();
    }

    // **ListView.builder로 렌더링**
    return ListView.builder(
      itemCount: selectedList.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final meatModel = selectedList[index];
        final isSelected = ref
            .read(favoritesProvider.notifier)
            .isFavorite(meatModel.type, meatModel.id);

        // 점수 계산
        final score = filterData != null
            ? _calculateScore(
                meatModel,
                filterData!['selectedAttributes'],
                filterData!['selectedValues'],
                _calculateWeights(filterData!['selectedAttributes']),
              )
            : null;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getMeatDetailScreen(meatModel),
                ),
              );
            },
            child: MeatListComponent(
              meatModel: meatModel,
              isSelected: isSelected,
              score: score,
            ),
          ),
        );
      },
    );
  }

  List<MeatModel> _filterAndSortMeatList(
      List<MeatModel> selectedList, Map<String, dynamic> filterData) {
    final selectedAttributes =
        filterData['selectedAttributes'] as List<String?>;
    final selectedValues = filterData['selectedValues'] as List<double?>;

    // 가중치 계산
    final weights = _calculateWeights(selectedAttributes);

    // 필터링 및 정렬
    return selectedList
      ..sort((a, b) {
        final aScore =
            _calculateScore(a, selectedAttributes, selectedValues, weights);
        final bScore =
            _calculateScore(b, selectedAttributes, selectedValues, weights);
        return bScore.compareTo(aScore);
      });
  }

  double _calculateScore(MeatModel meat, List<String?> selectedAttributes,
      List<double?> selectedValues, List<double> weights) {
    double score = 0.0;

    if (selectedAttributes.contains('식감')) {
      score += weights[selectedAttributes.indexOf('식감')] *
          (0.8 -
                  (meat.texture.sliderValue -
                          (selectedValues[selectedAttributes.indexOf('식감')] ??
                              0.0))
                      .abs())
              .clamp(0.0, 0.8);
    }

    if (selectedAttributes.contains('지방')) {
      score += weights[selectedAttributes.indexOf('지방')] *
          (0.8 -
                  (meat.savoryFlavor.sliderValue -
                          (selectedValues[selectedAttributes.indexOf('지방')] ??
                              0.0))
                      .abs())
              .clamp(0.0, 0.8);
    }

    if (selectedAttributes.contains('육향')) {
      score += weights[selectedAttributes.indexOf('육향')] *
          (0.8 -
                  (meat.meatAroma.sliderValue -
                          (selectedValues[selectedAttributes.indexOf('육향')] ??
                              0.0))
                      .abs())
              .clamp(0.0, 0.8);
    }

    // 총 가중치로 나누어 100점 만점으로 변환
    final totalWeight = weights.reduce((a, b) => a + b);
    if (totalWeight > 0) {
      score = (score / totalWeight / 0.8) * 100;
    }

    return score;
  }

  List<double> _calculateWeights(List<String?> selectedAttributes) {
    if (selectedAttributes[2] != null) {
      return [0.45, 0.35, 0.2];
    } else if (selectedAttributes[1] != null) {
      return [0.65, 0.35, 0.0];
    } else if (selectedAttributes[0] != null) {
      return [1.0, 0.0, 0.0];
    } else {
      return [0.0, 0.0, 0.0];
    }
  }
}
