import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: const Color(0xFFF4F6FA),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 홈 헤더
              const _HomeHeader(),
              Stack(
                clipBehavior: Clip.none, // Stack의 자식 요소들이 영역을 벗어나도 보이도록 설정
                children: [
                  // 메인 이미지
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/imgs/common/main.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 제목
                  const Positioned(
                    bottom: 40,
                    left: 16,
                    child: _TitleText(),
                  ),
                  // 검색창
                  const Positioned(
                    bottom: -25,
                    left: 16,
                    right: 16,
                    child: _SearchBar(),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // 사전 컴포넌트
              const _DictionaryComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/imgs/common/logo_home.png',
            height: 30,
            fit: BoxFit.fill,
          ),
          const Spacer(),
          PhosphorIcon(
            PhosphorIcons.star(),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '육식도감과 함께',
          style: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '고기, 알고 먹고\n똑똑하게 소비해요.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 검색 화면으로 이동
      },
      borderRadius: BorderRadius.circular(45.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.0),
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
          children: [
            PhosphorIcon(
              PhosphorIcons.magnifyingGlass(),
              color: Colors.black,
              size: 25,
            ),
            const SizedBox(width: 12.0),
            const Text(
              '부위별 검색하기',
              style: TextStyle(
                color: Color(0xFF8E8E93),
                fontSize: 18.0,
                fontFamily: "Pretendard",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DictionaryComponent extends StatelessWidget {
  const _DictionaryComponent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
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
            const SizedBox(height: 12),
            Row(
              children: [
                _CategoryCard(
                  width: (100.w - 32 - 32 - 15) / 2,
                  height: (100.w - 32 - 32 - 15) / 2,
                  imagePath: 'assets/imgs/common/pig_home.png',
                  label: '돼지고기',
                ),
                const SizedBox(width: 15.0),
                _CategoryCard(
                  width: (100.w - 32 - 32 - 15) / 2,
                  height: (100.w - 32 - 32 - 15) / 2,
                  imagePath: 'assets/imgs/common/cow_home.png',
                  label: '소고기',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final double width;
  final double height;

  const _CategoryCard({
    required this.height,
    required this.width,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
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
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 1.8 / 3,
            width: width * 1.8 / 3,
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
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
