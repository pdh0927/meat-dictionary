import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/component/meat_search_delegate.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/dictionary_list.dart';
import 'package:meat_dictionary/meat/component/meat_menu.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get routeName => 'home';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // 기본값을 돼지로 설정
  String selectedType = 'pork';

  void _onTypeChanged(String type) {
    setState(() {
      selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // 로고 이미지
              Image.asset(
                'assets/imgs/common/logo2.png',
                width: 35.w,
                height: 15.w,
                fit: BoxFit.fill,
              ),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F8), // 검색창 배경색
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: MeatSearchDelegate(ref: ref),
                        );
                      },
                      child: const Text(
                        '고기 이름을 검색해보세요!',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0XFF9496A1), // 힌트 텍스트 색상
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              MeatMenu(
                selectedType: selectedType,
                onTypeChanged: _onTypeChanged,
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: DictionaryList(
                  isFavoritesScreen: false,
                  type: selectedType,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
