import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ComparePopupComponent extends StatelessWidget {
  const ComparePopupComponent({
    super.key,
    required this.title,
    required this.highlight,
    required this.goodImageUrl,
    required this.badImageUrl,
    required this.goodDescriptions,
    required this.badDescriptions,
  });

  final String title;
  final String highlight;
  final String goodImageUrl;
  final String badImageUrl;
  final List<String> goodDescriptions;
  final List<String> badDescriptions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 제목
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title.split(highlight)[0],
                      style: const TextStyle(
                        color: BLACK_COLOR,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: highlight,
                      style: const TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: title.split(highlight).last,
                      style: const TextStyle(
                        color: BLACK_COLOR,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              _buildComparisonColumn(
                'GOOD',
                goodImageUrl,
                goodDescriptions,
                const Color(0xFF21D25B),
              ),
              const SizedBox(height: 15.0),
              _buildComparisonColumn(
                'BAD',
                badImageUrl,
                badDescriptions,
                Colors.redAccent,
              ),
            ],
          ),
        ),

        // 우측 상단 닫기 버튼
        Positioned(
          top: 15.0,
          right: 10.0,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(), // 팝업 닫기 기능
            child: const Icon(
              Icons.close,
              size: 24.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  // 이미지와 설명 목록을 포함하는 Column 위젯 생성 함수
  Widget _buildComparisonColumn(
    String label,
    String imageUrl,
    List<String> descriptions,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50.0,
          height: 25.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            width: 100.w - 70, // 이미지 크기 조정
            height: 25.h,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            errorWidget: (context, url, error) {
              return const Icon(Icons.error, color: Colors.red);
            },
          ),
        ),
        const SizedBox(height: 8.0),
        // 설명을 세로로 나열
        ...descriptions.map((description) => getDescription(description)),
      ],
    );
  }

  // 개별 설명 텍스트 위젯 생성 함수
  Widget getDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 4.0),
      child: Text(
        '• $description',
        style: const TextStyle(
          fontSize: 15.0,
          color: BLACK_COLOR,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
