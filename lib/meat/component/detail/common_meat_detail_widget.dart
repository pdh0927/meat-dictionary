import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/detail/meat_profile.dart';
import 'package:meat_dictionary/meat/component/two_menu.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CommonMeatDetailWidget extends ConsumerStatefulWidget {
  static String get routeName => 'mocksal_detail';

  const CommonMeatDetailWidget({
    super.key,
    required this.meatModel,
    required this.homeInformation,
    required this.chooseInformation,
  });

  final MeatModel meatModel;
  final Widget homeInformation;
  final Widget chooseInformation;

  @override
  ConsumerState<CommonMeatDetailWidget> createState() =>
      _MocksalDetailScreenState();
}

class _MocksalDetailScreenState extends ConsumerState<CommonMeatDetailWidget> {
  int selectedIndex = 0;

  void _onTypeChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = ref
        .watch(favoritesProvider.notifier)
        .isFavorite(widget.meatModel.type, widget.meatModel.id);

    return DefaultLayout(
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
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 공유하기 버튼
            InkWell(
              onTap: () {
                // 공유하기 버튼 눌렀을 때의 동작 여기에 추가
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 8.0,
                ),
                child: Icon(PhosphorIcons.share(), size: 24),
              ),
            ),
            // 즐겨찾기 버튼
            InkWell(
              onTap: () async {
                await ref.read(favoritesProvider.notifier).toggleFavorite(
                      widget.meatModel.type,
                      widget.meatModel.id,
                    );
                // 즐겨찾기 icon 상태 변경을 위해서 사용
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 8.0,
                ),
                child: Icon(
                  isSelected ? PhosphorIconsFill.star : PhosphorIcons.star(),
                  color: isSelected ? const Color(0XFFFF0000) : BLACK_COLOR,
                  size: 24.0,
                ),
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            MeatProfile(meatModel: widget.meatModel),
            const SizedBox(height: 30.0),
            TwoMenu(
              selectIndex: selectedIndex,
              onLeftTap: () => _onTypeChanged(0),
              onRightTap: () => _onTypeChanged(1),
              leftLabel: '홈',
              rightLabel: '고르는 팁',
            ),
            selectedIndex == 0
                ? widget.homeInformation
                : widget.chooseInformation
          ],
        ),
      ),
    );
  }
}
