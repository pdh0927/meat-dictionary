import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ComparePopupComponent extends StatefulWidget {
  const ComparePopupComponent({
    super.key,
    required this.title,
    required this.highlight,
    required this.goodImageUrls,
    required this.badImageUrls,
    required this.goodDetailImageUrls,
    required this.badDetailImageUrls,
    required this.goodDescriptions,
    required this.badDescriptions,
  });

  final String title;
  final String highlight;
  final List<String> goodImageUrls;
  final List<String> badImageUrls;
  final List<String?> goodDetailImageUrls; // null 허용: 설명 이미지
  final List<String?> badDetailImageUrls; // null 허용: 설명 이미지
  final List<String> goodDescriptions;
  final List<String> badDescriptions;

  @override
  State<ComparePopupComponent> createState() => _ComparePopupComponentState();
}

class _ComparePopupComponentState extends State<ComparePopupComponent> {
  Map<int, bool> goodImageStates = {};
  Map<int, bool> badImageStates = {};

  void toggleImage(int index, bool isGood) {
    setState(() {
      if (isGood) {
        goodImageStates[index] = !(goodImageStates[index] ?? false);
      } else {
        badImageStates[index] = !(badImageStates[index] ?? false);
      }
    });
  }

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
                      text: widget.title.split(widget.highlight)[0],
                      style: const TextStyle(
                        color: BLACK_COLOR,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: widget.highlight,
                      style: const TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: widget.title.split(widget.highlight).last,
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
                widget.goodImageUrls,
                widget.goodDetailImageUrls,
                widget.goodDescriptions,
                const Color(0xFF21D25B),
                true,
              ),

              const SizedBox(height: 15.0),

              _buildComparisonColumn(
                'BAD',
                widget.badImageUrls,
                widget.badDetailImageUrls,
                widget.badDescriptions,
                Colors.redAccent,
                false,
              ),
            ],
          ),
        ),

        // 우측 상단 닫기 버튼
        Positioned(
          top: 15.0,
          right: 10.0,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
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

  Widget _buildComparisonColumn(
    String label,
    List<String> imageUrls,
    List<String?> detailImageUrls,
    List<String> descriptions,
    Color color,
    bool isGood,
  ) {
    return SizedBox(
      width: 100.w - 70,
      child: Column(
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

          // 이미지 영역: 이미지가 없으면 표시하지 않음
          if (imageUrls.isNotEmpty)
            SizedBox(
              height: 25.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => toggleImage(index, isGood),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: (isGood
                                      ? goodImageStates[index]
                                      : badImageStates[index]) ==
                                  true
                              ? (detailImageUrls[index] ?? imageUrls[index])
                              : imageUrls[index],
                          fit: BoxFit.fill,
                          width: 100.w - 90,
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
                    ),
                  );
                },
              ),
            ),

          // 이미지가 없는 경우에도 설명은 항상 표시
          SizedBox(height: imageUrls.isNotEmpty ? 8.0 : 0.0),
          ...descriptions.map((description) => getDescription(description)),
        ],
      ),
    );
  }

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
