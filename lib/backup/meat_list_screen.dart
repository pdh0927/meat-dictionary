import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/common/view/custom_search_screen.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/filter_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 사전 내 고기 리스트 화면
class MeatListScreen extends StatefulWidget {
  static String get routeName => 'meat_list';

  const MeatListScreen({
    super.key,
    required this.meatType,
  });

  final MeatType meatType;

  @override
  State createState() => _MeatListScreenState();
}

class _MeatListScreenState extends State<MeatListScreen> {
  Map<String, dynamic>? filterData;

  void _applyFilter(Map<String, dynamic> data) {
    setState(() {
      filterData = data;
    });
  }

  void _clearFilter() {
    setState(() {
      filterData = null; // 필터 데이터를 초기화하여 필터 해제
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: widget.meatType.label,
      leading: InkWell(
        onTap: () {
          _clearFilter(); // 뒤로가기 버튼을 눌렀을 때 필터 해제
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.0,
            vertical: 8.0,
          ),
          child: Icon(PhosphorIconsBold.arrowLeft, size: 24),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomSearchScreen(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(PhosphorIcons.magnifyingGlass()),
          ),
        )
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // child: CustomSearchBar(isHome: false),
            ),
            const SizedBox(height: 10),
            _FilterButton(
              onApplyFilter: _applyFilter,
              onClearFilter: _clearFilter,
            ),
            const SizedBox(height: 12),
            if (filterData != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _SelectedFilters(
                  selectedAttributes: filterData!['selectedAttributes'],
                  selectedValues: filterData!['selectedValues'],
                ),
              ),
            if (filterData != null) const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 260,
              alignment: Alignment.center,
              color: Colors.grey,
              child: Image.asset(
                "assets/imgs/common/tmp_pig_list.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            MeatList(
              isFavoritesScreen: false,
              meatType: widget.meatType,
              filterData: filterData, // 필터 데이터를 전달
            ),
          ],
        ),
      ),
    );
  }
}

// 필터 버튼 및 필터 해제 버튼
class _FilterButton extends StatelessWidget {
  final Function(Map<String, dynamic>) onApplyFilter;
  final VoidCallback onClearFilter;

  const _FilterButton({
    required this.onApplyFilter,
    required this.onClearFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            final result = await context.pushNamed(FilterScreen.routeName);
            if (result != null && result is Map<String, dynamic>) {
              onApplyFilter(result);
            }
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45.0),
              border: Border.all(
                color: const Color(0xFFD2D2D7),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '필터',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR,
                  ),
                ),
                const SizedBox(width: 1.0),
                Icon(
                  PhosphorIcons.slidersHorizontal(),
                  color: BLACK_COLOR,
                  size: 17,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        InkWell(
          onTap: onClearFilter,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45.0),
              border: Border.all(
                color: const Color(0xFFD2D2D7),
                width: 1.0,
              ),
            ),
            child: const Text(
              '필터 해제',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: BLACK_COLOR,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 선택된 필터를 표시하는 위젯
class _SelectedFilters extends StatelessWidget {
  final List<String?> selectedAttributes;
  final List<double?> selectedValues;

  const _SelectedFilters({
    required this.selectedAttributes,
    required this.selectedValues,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selectedAttributes.isNotEmpty && selectedAttributes[0] != null)
          Text(
            '1순위: ${selectedAttributes[0]} - ${_getLabelForValue(selectedAttributes[0], selectedValues[0])}',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: BLACK_COLOR,
            ),
          ),
        if (selectedAttributes.length > 1 && selectedAttributes[1] != null)
          Text(
            '2순위: ${selectedAttributes[1]} - ${_getLabelForValue(selectedAttributes[1], selectedValues[1])}',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: BLACK_COLOR,
            ),
          ),
        if (selectedAttributes.length > 2 && selectedAttributes[2] != null)
          Text(
            '3순위: ${selectedAttributes[2]} - ${_getLabelForValue(selectedAttributes[2], selectedValues[2])}',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: BLACK_COLOR,
            ),
          ),
      ],
    );
  }

  String _getLabelForValue(String? attribute, double? value) {
    if (attribute == null || value == null) return '';

    switch (attribute) {
      case '식감':
        return MeatTextureExtension.fromSliderValue(value).label;
      case '지방':
        return SavoryFlavorExtension.fromSliderValue(value).label;
      case '육향':
        return MeatAromaExtension.fromSliderValue(value).label;
      default:
        return value.toStringAsFixed(1); // 해당 사항 없을 경우 숫자로 표시
    }
  }
}
