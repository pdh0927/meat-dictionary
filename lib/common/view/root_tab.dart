import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/view/card_news_screen.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/common/provider/root_tab_index_provider.dart';
import 'package:meat_dictionary/common/view/custom_search_screen.dart';
import 'package:meat_dictionary/common/view/home_screen.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

import 'package:meat_dictionary/meat/view/favorites_screen.dart';
import 'package:meat_dictionary/meat/view/meat_list_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 루트탭
class RootTab extends ConsumerStatefulWidget {
  static String get routeName => 'rootTab';

  const RootTab({super.key});

  @override
  ConsumerState<RootTab> createState() => _RootTabState();
}

class _RootTabState extends ConsumerState<RootTab>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // length : 몇 개 탭 사용할건지, vsync : 현재의  state 넣어주면 됨(그런데 SingleTickerProviderStateMixin이라는 기능 가지고 있어야함)
    controller = TabController(length: 5, vsync: this);
    // controller의 변경사항이 감지될 때마다 tabListener 함수 실행
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    ref.read(rootTabIndexProvider.notifier).state = controller.index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: BLACK_COLOR,
        unselectedItemColor: BLACK_COLOR,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (int index) {
          controller
              .animateTo((index)); // 현재 탭과 인덱스가 다를 경우, 애니메이션을 사용하여 탭을 부드럽게 전환
        },
        currentIndex: ref.watch(rootTabIndexProvider),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              ref.watch(rootTabIndexProvider) == 0
                  ? PhosphorIconsFill.house
                  : PhosphorIcons.house(),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              ref.watch(rootTabIndexProvider) == 1
                  ? PhosphorIconsFill.magnifyingGlass
                  : PhosphorIcons.magnifyingGlass(),
            ),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              ref.watch(rootTabIndexProvider) == 2
                  ? PhosphorIconsFill.book
                  : PhosphorIcons.book(),
            ),
            label: '도감',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              ref.watch(rootTabIndexProvider) == 3
                  ? PhosphorIconsFill.newspaper
                  : PhosphorIcons.newspaper(),
            ),
            label: '카드뉴스',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              ref.watch(rootTabIndexProvider) == 4
                  ? PhosphorIconsFill.heart
                  : PhosphorIcons.heart(),
            ),
            label: '즐겨찾기',
          ),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // scroll로는 화면 전환 x
        controller: controller,
        children: const [
          HomeScreen(),
          CustomSearchScreen(),
          MeatListScreen(meatType: MeatType.pork),
          CardNewsScreen(),
          FavoritesScreen(),
        ],
      ),
    );
  }
}
