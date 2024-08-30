import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/custom_search_bar.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/filter_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 사전 내 고기 리스트 화면
class MeatListScreen extends StatelessWidget {
  static String get routeName => 'meat_list';

  const MeatListScreen({
    super.key,
    required this.meatType,
  });

  final MeatType meatType;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        // 화면 title
        title: meatType.label,
        // 뒤로가기 버튼
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
        // 검색 버튼
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(PhosphorIcons.magnifyingGlass()),
            ),
          )
        ],
        // 화면 구성 내용
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 검색바
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomSearchBar(isHome: false),
              ),
              const SizedBox(height: 10),
              // 필터
              const _FilterButton(),
              const SizedBox(height: 12),
              // 배너
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
              // 고기 리스트
              MeatList(
                isFavoritesScreen: false,
                meatType: meatType,
              ),
            ],
          ),
        ));
  }
}

// 필터 버튼
class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          context.pushNamed(FilterScreen.routeName);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45.0),
            border: Border.all(
              color: const Color(0xFFD2D2D7),
              width: 1.0, // 테두리 두께
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
    );
  }
}
