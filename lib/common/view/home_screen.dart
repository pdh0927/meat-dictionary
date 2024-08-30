import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/custom_search_bar.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/favorites_screen.dart';
import 'package:meat_dictionary/meat/view/meat_list_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 홈 화면
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: const Color(0xFFF4F6FA),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 홈 화면 로고
              Image.asset(
                'assets/imgs/common/logo_home.png',
                height: 30,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              // 검색창
              const CustomSearchBar(isHome: true),
              const SizedBox(height: 20),
              // 사전 바로가기
              const _DictionaryComponent(),
              const SizedBox(height: 20),
              // 즐겨찾기 바로가기
              const _FavoritesComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

// 사전 widget
class _DictionaryComponent extends StatelessWidget {
  const _DictionaryComponent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '육식도감 사전 바로가기 🥩',
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 15),
        LayoutBuilder(
          builder: (context, constraints) {
            double aspectRatio;
            if (constraints.maxWidth < 350) {
              // 작은 화면
              aspectRatio = 0.88;
            } else {
              // 큰 화면
              aspectRatio = 0.9;
            }
            return Row(
              children: [
                // 돼지 card
                Expanded(
                  child: AspectRatio(
                    aspectRatio: aspectRatio,
                    child: const _CategoryCard(
                      imagePath: 'assets/imgs/common/pig_home.png',
                      meatType: MeatType.pork,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                // 소 card
                Expanded(
                  child: AspectRatio(
                    aspectRatio: aspectRatio,
                    child: const _CategoryCard(
                      imagePath: 'assets/imgs/common/cow_home.png',
                      meatType: MeatType.beef,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

// 사전으로 가기위한 card
class _CategoryCard extends StatelessWidget {
  final String imagePath;
  final MeatType meatType;

  const _CategoryCard({
    required this.imagePath,
    required this.meatType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 고기 리스트 바로가기
        context.pushNamed(
          MeatListScreen.routeName,
          extra: meatType,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 7.2,
              spreadRadius: 0.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 이미지
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Image.asset(
                imagePath,
              ),
            ),
            const SizedBox(height: 13.0),
            // 고기 라벨
            Text(
              meatType.label,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 즐겨찾기 바로가기
class _FavoritesComponent extends StatelessWidget {
  const _FavoritesComponent();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(FavoritesScreen.routeName);
      },
      child: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 7.2,
              spreadRadius: 0.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text 설명
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '즐겨찾기 바로가기',
                  style: TextStyle(
                    color: BLACK_COLOR,
                    fontFamily: 'Pretendard',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '자주 찾는 고기는 여기서 볼 수 있어요.',
                  style: TextStyle(
                    color: GREY_70_COLOR,
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            // 즐겨찾기 아이콘
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                color: BLUE_COLOR,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  PhosphorIconsFill.star,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
