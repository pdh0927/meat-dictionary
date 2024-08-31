import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 필터 스크린
class FilterScreen extends StatefulWidget {
  static String get routeName => 'filter';

  const FilterScreen({super.key});

  @override
  State createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // 각 순위에서 선택된 속성
  List<String?> selectedAttributes = [null, null, null];
  // 각 순위에서 선택된 단계
  List<double?> selectedValues = [null, null, null];

  // 속성이 선택 되었을 때 동작
  void _onAttributeSelected(int index, String attribute) {
    setState(() {
      selectedAttributes[index] = attribute;
      selectedValues[index] = null; // 속성이 변경되면 값은 초기화
    });
  }

  // 값이 선택 되었을 때 동작
  void _onValueSelected(int index, double value) {
    setState(() {
      selectedValues[index] = value;
    });
  }

  // 속성 1개 초기화
  void _resetAttribute(int index) {
    setState(() {
      for (int i = index; i < selectedAttributes.length; i++) {
        selectedAttributes[i] = null;
        selectedValues[i] = null;
      }
    });
  }

  // 속성 전체 초기화
  void _resetAll() {
    setState(() {
      selectedAttributes = [null, null, null];
      selectedValues = [null, null, null];
    });
  }

  // 사용가능한 속성 가져오기
  List<String> _getAvailableAttributes(int index) {
    List<String> allAttributes = ['식감', '지방', '육향'];

    for (int i = 0; i < index; i++) {
      allAttributes.remove(selectedAttributes[i]);
    }

    return allAttributes;
  }

  // 필터 적용 버튼을 눌렀을 때 선택된 속성과 값을 MeatListScreen으로 전달
  void _applyFilters() {
    Navigator.pop(context, {
      'selectedAttributes': selectedAttributes,
      'selectedValues': selectedValues,
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '필터',
      leading: InkWell(
        onTap: () {
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 14.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '우선순위로 검색할 수 있어요.',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: BLACK_COLOR,
                    ),
                  ),
                  InkWell(
                    onTap: _resetAll,
                    child: const Text(
                      '초기화',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: GREY_40_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              // 1순위
              _AttributeSelectWidget(
                num: 1,
                selectedAttribute: selectedAttributes[0],
                selectedValue: selectedValues[0],
                onAttributeSelected: (attr) => _onAttributeSelected(0, attr),
                onValueSelected: (val) => _onValueSelected(0, val),
                availableAttributes: _getAvailableAttributes(0),
                onReset: () => _resetAttribute(0),
              ),
              const SizedBox(height: 20.0),
              // 2순위
              if (selectedAttributes[0] != null)
                _AttributeSelectWidget(
                  num: 2,
                  selectedAttribute: selectedAttributes[1],
                  selectedValue: selectedValues[1],
                  onAttributeSelected: (attr) => _onAttributeSelected(1, attr),
                  onValueSelected: (val) => _onValueSelected(1, val),
                  availableAttributes: _getAvailableAttributes(1),
                  onReset: () => _resetAttribute(1),
                ),
              const SizedBox(height: 20.0),
              // 3순위
              if (selectedAttributes[1] != null)
                _AttributeSelectWidget(
                  num: 3,
                  selectedAttribute: selectedAttributes[2],
                  selectedValue: selectedValues[2],
                  onAttributeSelected: (attr) => _onAttributeSelected(2, attr),
                  onValueSelected: (val) => _onValueSelected(2, val),
                  availableAttributes: _getAvailableAttributes(2),
                  onReset: () => _resetAttribute(2),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _applyFilters,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.red, // 버튼 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  '적용',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 속성 선택 위젯
class _AttributeSelectWidget extends StatelessWidget {
  const _AttributeSelectWidget({
    required this.num,
    required this.selectedAttribute,
    required this.selectedValue,
    required this.onAttributeSelected,
    required this.onValueSelected,
    required this.availableAttributes,
    required this.onReset,
  });

  final int num;
  final String? selectedAttribute;
  final double? selectedValue;
  final List<String> availableAttributes;
  final Function(String) onAttributeSelected;
  final Function(double) onValueSelected;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    List<String> allAttributes = ['식감', '지방', '육향'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 순위 표시
            Text(
              '$num순위',
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                color: GREY_80_COLOR,
              ),
            ),
            // 속성 박스
            Row(
              children: allAttributes.map((attribute) {
                bool isDisabled = !availableAttributes.contains(attribute);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _AttributeCard(
                    name: attribute,
                    isSelected: selectedAttribute == attribute,
                    onTap: isDisabled
                        ? null
                        : () => onAttributeSelected(attribute),
                  ),
                );
              }).toList(),
            ),
            // 초기화 버튼
            InkWell(
              onTap: onReset,
              child: Icon(PhosphorIcons.arrowCounterClockwise()),
            ),
          ],
        ),
        // 선택 된 속성이 있다면 value box
        if (selectedAttribute != null)
          _ValueBox(
            label: selectedAttribute!,
            onValueSelected: onValueSelected,
            selectedValue: selectedValue ?? 0.0,
          ),
      ],
    );
  }
}

// 속성 선택 card
class _AttributeCard extends StatelessWidget {
  const _AttributeCard({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final bool isSelected;
  final VoidCallback? onTap; // onTap이 null이면 이미 선택되었으므로 비활성화
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.0),
          color: isSelected
              ? BLACK_COLOR
              : (onTap == null ? const Color(0xFFCCCCCC) : GREY_10_COLOR),
        ),
        // 속성 라벨
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14.0,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color: isSelected
                ? WHITE_COLOR
                : (onTap == null ? const Color(0xFF666666) : BLACK_COLOR),
          ),
        ),
      ),
    );
  }
}

// 값 선택 박스
class _ValueBox extends StatefulWidget {
  const _ValueBox({
    required this.label,
    required this.onValueSelected,
    required this.selectedValue,
  });

  final String label;
  final Function(double) onValueSelected;
  final double selectedValue;

  @override
  State<_ValueBox> createState() => _ValueBoxState();
}

class _ValueBoxState extends State<_ValueBox> {
  double _currentValue = 0.0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selectedValue;
  }

  Map<String, String> descriptions = {
    '식감': '부드러울수록 먹기 편하고, 쫄깃할수록 씹는 맛이 있어요!',
    '지방': '지방이 적을수록 담백하고, 많을수록 고소해요!',
    '육향': '육향이 약할수록 호불호가 없고, 강할수록 고유의 맛을 잘 느낄 수 있어요!',
  };

  @override
  Widget build(BuildContext context) {
    List<String> values;
    double sliderMax;

    // 값에 따른 값라벨 표시
    switch (widget.label) {
      case '식감':
        values = MeatTexture.values.map((e) => e.label).toList();
        sliderMax = MeatTexture.values.length - 1;
        break;
      case '육향':
        values = MeatAroma.values.map((e) => e.label).toList();
        sliderMax = MeatAroma.values.length - 1;
        break;
      case '지방':
        values = SavoryFlavor.values.map((e) => e.label).toList();
        sliderMax = SavoryFlavor.values.length - 1;
        break;
      default:
        values = [];
        sliderMax = 0.0;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      margin: const EdgeInsets.only(top: 15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: GREY_10_COLOR, width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 선택 문구
          Text(
            '원하는 ${widget.label}을 선택해주세요.',
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),
          // 속성 설명
          Text(
            descriptions[widget.label]!,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10.0),
          // 선택 값 표시 텍스트
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: 84,
                child: Text(
                  values[_currentValue.toInt()],
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: BLACK_COLOR,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Expanded(
                child: Column(
                  children: [
                    // 선택 Slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.red,
                        inactiveTrackColor: GREY_10_COLOR,
                        thumbColor: Colors.white,
                        overlayColor: Colors.red.withOpacity(0.2),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12.0),
                        overlayShape: SliderComponentShape
                            .noOverlay, // 오버레이를 제거하여 양 옆 공간을 줄임
                      ),
                      child: Slider(
                        value: _currentValue,
                        min: 0,
                        max: sliderMax,
                        divisions: values.length - 1,
                        label: values[_currentValue.toInt()],
                        onChanged: (value) {
                          setState(() {
                            _currentValue = value;
                          });
                          widget.onValueSelected(value / 5);
                        },
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    // 최대, 최소 값라벨 표시
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          values.first,
                          style: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: GREY_80_COLOR,
                          ),
                        ),
                        Text(
                          values.last,
                          style: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: GREY_80_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
