import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/component/slide_card_news_widget.dart';
import 'package:meat_dictionary/card_news/provider/random_card_news_provider.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/meat_list_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// 홈 화면
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomCardNews = ref.watch(randomCardNewsProvider); // 랜덤 카드뉴스

    return DefaultLayout(
      backgroundColor: const Color(0xFFF4F6FA),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 카드뉴스 위젯
              randomCardNews == null
                  ? buildShimmer()
                  : SlideCardNewsWidget(
                      urls: randomCardNews.urls,
                      isPopup: false,
                      width: 100.w,
                      height: 100.w,
                    ),

              const SizedBox(height: 24.0),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // 사전 바로가기 위젯
                    _DictionaryComponent(),

                    SizedBox(height: 16.0),

                    // 취향 저격 부위 찾기 버튼
                    _ChooseOwnMeat(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // shimmer를 return 하는 함수
  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 100.w,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}

// 사전 바로가기 위젯
class _DictionaryComponent extends StatelessWidget {
  const _DictionaryComponent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        Text(
          '어떤 고기를 찾고 계시나요?',
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 15),

        // 바로가기 버튼
        Row(
          children: [
            // 돼지 card
            Expanded(
              child: _CategoryCard(
                imagePath: 'assets/imgs/common/pig_home.png',
                description: '극강 감칠맛과 다용도 활용',
                meatType: MeatType.pork,
              ),
            ),
            SizedBox(width: 15.0),
            // 소 card
            Expanded(
              child: _CategoryCard(
                imagePath: 'assets/imgs/common/cow_home.png',
                description: '진항 풍미와 고급진 맛',
                meatType: MeatType.beef,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 사전으로 가는 카드 위젯
class _CategoryCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final MeatType meatType;

  const _CategoryCard({
    required this.imagePath,
    required this.description,
    required this.meatType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 고기 리스트 바로가기
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeatListScreen(
              meatType: meatType,
              isTap: false,
            ),
          ),
        );
      },
      child: Container(
        height: 120.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 설명
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15.0),

            // 고기 라벨
            Text(
              meatType.label,
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 취향 저격 부위 찾기 버튼
class _ChooseOwnMeat extends StatelessWidget {
  const _ChooseOwnMeat();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '원하는 부위를 못 고르겠다면',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '취향 저격 부위 찾기',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Icon(
              PhosphorIcons.caretRight(),
              color: Colors.white,
              size: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
