import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

// 레시피 위젯 프레임
class RecipeWidgetFrame extends StatelessWidget {
  const RecipeWidgetFrame({
    super.key,
    required this.imageUrls,
    required this.titles,
    required this.foodNames,
    required this.linkUrls,
  });

  final List<String> imageUrls;
  final List<String> titles;
  final List<String> foodNames;
  final List<String> linkUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '추천',
                  style: detailThinContentStyle,
                ),
                TextSpan(
                  text: '레시피',
                  style: detailBoldContentStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          // 레시피 카드 그리드
          _buildRecipeGrid(),
        ],
      ),
    );
  }

  // 레시피 카드 그리드 빌드
  Widget _buildRecipeGrid() {
    return Column(
      children: [
        for (int i = 0; i < imageUrls.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: _RecipeCard(
                    imageUrl: imageUrls[i],
                    title: titles[i],
                    foodName: foodNames[i],
                    linkUrl: linkUrls[i],
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _RecipeCard(
                    imageUrl: imageUrls[i + 1],
                    title: titles[i + 1],
                    foodName: foodNames[i + 1],
                    linkUrl: linkUrls[i + 1],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// 레시피 카드 컴포넌트
class _RecipeCard extends StatelessWidget {
  const _RecipeCard({
    required this.imageUrl,
    required this.foodName,
    required this.title,
    required this.linkUrl,
  });

  final String imageUrl;
  final String foodName;
  final String title;
  final String linkUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(linkUrl);

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $linkUrl';
        }
      },
      child: Stack(
        children: [
          // 이미지 배경
          Container(
            width: 168.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), // 투명도를 40%로 설정
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // 텍스트 레이어
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline, // 밑줄 추가
                      decorationColor: PRIMARY_COLOR, // 밑줄 색상 설정
                      decorationThickness: 2.5, // 밑줄 두께 설정
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    foodName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
