import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/meat/component/detail/basic_choosing_tips.dart';
import 'package:meat_dictionary/meat/backup/common_meat_detail_widget.dart';
import 'package:meat_dictionary/meat/component/detail/custom_content_text.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

class OldMocksalDetailScreen extends StatelessWidget {
  // static String get routeName => 'mocksal_detail';

  const OldMocksalDetailScreen({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context) {
    return CommonMeatDetailWidget(
        meatModel: meatModel,
        homeInformation: const _HomeInformation(),
        chooseInformation: const _ChoosingTips());
  }
}

class _HomeInformation extends StatelessWidget {
  const _HomeInformation();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // 소개
        _Introduction(),
        Divider(
          color: Color(0xFFF4F6FA),
          height: 0,
          thickness: 15.0,
        ),
        // 특징
        _Characteristic()
      ],
    );
  }
}

// 소개
class _Introduction extends StatelessWidget {
  const _Introduction();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Text('소개', style: detailTitleStyle),
          const SizedBox(height: 13.0),
          // 위치 이미지
          Image.asset(
            'assets/imgs/pork/mocksal/mocksal_introduction.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 13.0),
          // 간단 소개
          Text('🐷 머리와 등심 사이, 목의 살이에요.', style: detailContentStyle),
          Text('💡 담백한 고기를 선호한다면 목살을 추천해요.', style: detailContentStyle),
        ],
      ),
    );
  }
}

class _Characteristic extends StatelessWidget {
  const _Characteristic();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Text('특징', style: detailTitleStyle),
          const SizedBox(height: 13.0),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              children: [
                CustomContentText(
                  text: '지방과 살코기의 비율이 조화로운 부위예요.',
                  textStyle: detailContentStyle,
                  dotSize: 15.0,
                ),
                CustomContentText(
                  text: '목살은 크게 머리쪽 목살과 등심쪽 목살 두가지로 나뉘어요.',
                  textStyle: detailContentStyle,
                  dotSize: 15.0,
                ),
                CustomContentText(
                  text: '기름과 살코기를 분리해서 구우면 더 맛있어요.',
                  textStyle: detailContentStyle,
                  dotSize: 15.0,
                ),
                CustomContentText(
                  text: '목심, 목등심 등으로도 불려요.',
                  textStyle: detailContentStyle,
                  dotSize: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 고르는 팁
class _ChoosingTips extends StatelessWidget {
  const _ChoosingTips();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // 기본적으로 고기 잘 고르는법
        BasicChoosingTips(),
        Divider(
          color: Color(0xFFF4F6FA),
          height: 0,
          thickness: 15.0,
        ),
        SizedBox(height: 20.0),
        // 잘린 고기 고르는 팁
        _CutMeatChoosingTips(), SizedBox(height: 20.0),
      ],
    );
  }
}

// 잘린 고기 고르는 팁
class _CutMeatChoosingTips extends StatelessWidget {
  const _CutMeatChoosingTips();

  // 추천 고기 이미지 경로
  final List<String> goodImagePaths = const [
    'assets/imgs/pork/mocksal/mocksal_good_1.png',
    'assets/imgs/pork/mocksal/mocksal_good_1.png',
    'assets/imgs/pork/mocksal/mocksal_good_1.png',
    'assets/imgs/pork/mocksal/mocksal_good_1.png',
    'assets/imgs/pork/mocksal/mocksal_good_1.png',
  ];

  // 비추천 고기 이미지 경로
  final List<String> badImagePaths = const [
    'assets/imgs/pork/mocksal/mocksal_bad_1.png',
    'assets/imgs/pork/mocksal/mocksal_bad_1.png',
    'assets/imgs/pork/mocksal/mocksal_bad_1.png',
    'assets/imgs/pork/mocksal/mocksal_bad_1.png',
    'assets/imgs/pork/mocksal/mocksal_bad_1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목
              Text('잘린 목살 고르는 팁', style: detailTitleStyle),
              const SizedBox(height: 13.0),
              // 소제목
              Text(
                '이런 고기를 추천해요.',
                style: detailTitleStyle.copyWith(
                  fontSize: 17.0,
                  color: const Color(0xFF007BFE),
                ),
              ),
              const SizedBox(height: 7.0),
              // 추천 고기 특징
              Text(
                '🥩 작은 살코기 섬이 많아요.',
                style: detailContentStyle.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        // 추천 고기 사진
        _HorizontalImages(
          imagePaths: goodImagePaths,
          height: 120.0,
          width: 120.0,
        ),
        const SizedBox(height: 7.0),
        // 추천 고기 부가 설명
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '지방이 잘 분포되었고, 작은 동그란 살코기가 많은 앞목살이에요.',
            style: detailContentStyle.copyWith(fontSize: 14.0),
          ),
        ),
        const SizedBox(height: 13.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 소제목
              Text(
                '이런 고기는 비추천해요.',
                style: detailTitleStyle.copyWith(
                  fontSize: 17.0,
                  color: const Color(0xFFFF0000),
                ),
              ),
              const SizedBox(height: 7.0),
              // 비추천 고기 특징
              Text(
                '😔 한 쪽 살코기가 너무 커요.',
                style: detailContentStyle.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        // 비추천 고기 사진
        _HorizontalImages(
          imagePaths: badImagePaths,
          height: 120.0,
          width: 120.0,
        ),
        const SizedBox(height: 7.0),
        // 비추천 고기 부가 설명
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '잘 굽지 못한다면, 퍽퍽하게 먹을 가능성이 큰 고기에요.',
            style: detailContentStyle.copyWith(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}

class _HorizontalImages extends StatelessWidget {
  const _HorizontalImages({
    required this.imagePaths,
    required this.height,
    required this.width,
  });

  final List<String> imagePaths;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // 이미지 높이
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.7), // 배경 흐림 효과
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            imagePaths[index], // 이미지 경로
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePaths[index], // 이미지 경로
                  fit: BoxFit.fill,
                  width: width, // 이미지 가로
                  height: height, // 이미지 높이
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
