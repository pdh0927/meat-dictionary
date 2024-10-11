import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/meat_list_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// 홈 화면
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      backgroundColor: const Color(0xFFF4F6FA),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 카드뉴스 위젯
              ImageCarousel(
                imageUrls: [
                  'assets/imgs/beef/안심.png',
                  'assets/imgs/beef/안심.png',
                  'assets/imgs/beef/안심.png',
                  'assets/imgs/beef/안심.png',
                  'assets/imgs/beef/안심.png',
                  'assets/imgs/beef/안심.png',
                ],
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // 사전 바로가기 widget
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
}

// 카드뉴스 위젯
class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarousel({super.key, required this.imageUrls});

  @override
  State createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 1 / 0.9,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        Positioned(
          bottom: 16.0,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: widget.imageUrls.length,
            effect: const WormEffect(
              dotWidth: 8.0,
              dotHeight: 8.0,
              activeDotColor: PRIMARY_COLOR,
              dotColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

// 사전 바로가기 widget
class _DictionaryComponent extends StatelessWidget {
  const _DictionaryComponent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '어떤 고기를 찾고 계시나요?',
          style: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
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
        )
      ],
    );
  }
}

// 사전으로 가기위한 card
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
        context.pushNamed(
          MeatListScreen.routeName,
          extra: meatType,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                )
              ],
            ),
            Icon(
              PhosphorIcons.caretRight(),
              color: Colors.white,
              size: 25.0,
            )
          ],
        ),
      ),
    );
  }
}
