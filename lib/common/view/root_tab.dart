import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/common/provider/root_tab_index_provider.dart';
import 'package:meat_dictionary/common/view/home_screen.dart';
import 'package:meat_dictionary/meat/view/favorites_screen.dart';

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
    controller = TabController(length: 2, vsync: this);
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
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BLACK_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: (int index) {
            controller
                .animateTo((index)); // 현재 탭과 인덱스가 다를 경우, 애니메이션을 사용하여 탭을 부드럽게 전환
          },
          currentIndex: ref.watch(rootTabIndexProvider),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/icon_nav_home.svg',
                  color: controller.index == 0 ? PRIMARY_COLOR : BLACK_COLOR,
                ),
                label: '홈'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_nav_bookmark.svg',
                color: controller.index == 1 ? PRIMARY_COLOR : BLACK_COLOR,
              ),
              label: '즐겨찾기',
            ),
          ]),
      child: TabBarView(
          physics: const NeverScrollableScrollPhysics(), // scroll로는 화면 전환 x
          controller: controller,
          children: const [
            HomeScreen(),
            FavoritesScreen(),
          ]),
    );
  }
}
