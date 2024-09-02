import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/meat/component/meat_list_component.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';
import 'package:meat_dictionary/meat/view/detail/pork/mocksal_detail_screen.dart';
import 'package:go_router/go_router.dart';

// 고기 리스트
class MeatList extends ConsumerWidget {
  final bool isFavoritesScreen;
  final MeatType meatType;
  final Map<String, dynamic>? filterData; // 필터 데이터를 전달

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

    // 필터 데이터가 존재하는 경우 리스트를 필터링 및 정렬
    if (filterData != null) {
      selectedList = _filterAndSortMeatList(selectedList, filterData!);
    }

    // 즐겨찾기 화면인 경우 즐겨찾기 항목만 필터링
    if (isFavoritesScreen) {
      selectedList = selectedList
          .where(
              (meat) => favoriteIds.contains(meat.id) && meat.type == meatType)
          .toList();
    }

    final Map<String, String> meatDetailRoutes = {
      '목살': MocksalDetailScreen.routeName,
    };

    return Column(
      children: selectedList.map((meatModel) {
        final isSelected = ref
            .read(favoritesProvider.notifier)
            .isFavorite(meatModel.type, meatModel.id);

        // 점수 계산
        final score = filterData != null
            ? _calculateScore(
                meatModel,
                filterData!['selectedAttributes'],
                filterData!['selectedValues'],
                _calculateWeights(filterData!['selectedAttributes']))
            : null;

        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              child: InkWell(
                onTap: () {
                  final routeName = meatDetailRoutes[meatModel.name];
                  if (routeName != null) {
                    context.pushNamed(
                      routeName,
                      extra: {'meatModel': meatModel},
                    );
                  } else {
                    context.pushNamed("meat_detail");
                  }
                },
                child: MeatListComponent(
                  meatModel: meatModel,
                  isSelected: isSelected,
                  score: score,
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

  List<MeatModel> _filterAndSortMeatList(
      List<MeatModel> selectedList, Map<String, dynamic> filterData) {
    final List<String?> selectedAttributes = filterData['selectedAttributes'];
    final List<double?> selectedValues = filterData['selectedValues'];

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
      return [0.0, 0.0, 0.0]; // 모든 가중치가 0인 경우 처리
    }
  }
}
