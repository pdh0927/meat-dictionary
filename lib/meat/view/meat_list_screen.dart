import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/meat_list.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
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
