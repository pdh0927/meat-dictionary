import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/component/detail/compare_popup_component.dart';
import 'package:shimmer/shimmer.dart';

// 가로 스크롤 이미지
class HorizontalImages extends StatelessWidget {
  const HorizontalImages({
    super.key,
    required this.titles,
    required this.highlights,
    required this.descriptions,
    required this.goodImageUrls,
    required this.badImageUrls,
    required this.goodDescriptionsList,
    required this.badDescriptionsList,
  });

  final List<String> titles;
  final List<String> highlights;
  final List<String> descriptions;
  final List<String> goodImageUrls;
  final List<String> badImageUrls;
  final List<List<String>> goodDescriptionsList;
  final List<List<String>> badDescriptionsList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(goodImageUrls.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == goodImageUrls.length - 1 ? 16 : 0, left: 16.0),
            child: SizedBox(
              width: 180.0,
              child: GestureDetector(
                onTap: () {
                  // 확대 했을 때
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.7),
                    builder: (BuildContext context) {
                      return Dialog(
                        insetPadding:
                            const EdgeInsets.all(10.0), // 화면 가장자리에서 여백
                        backgroundColor: Colors.transparent, // 투명 배경
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.9, // 화면의 90% 너비 사용
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IntrinsicHeight(
                            child: ComparePopupComponent(
                              title: titles[index],
                              highlight: highlights[index],
                              goodImageUrl: goodImageUrls[index],
                              badImageUrl: badImageUrls[index],
                              goodDescriptions: goodDescriptionsList[index],
                              badDescriptions: badDescriptionsList[index],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지
                    CachedNetworkImage(
                      imageUrl: goodImageUrls[index],
                      fit: BoxFit.fill,
                      width: 180,
                      height: 120,
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

                    const SizedBox(height: 4.0),

                    // 제목
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '✔️ ${titles[index].split(highlights[index])[0]}',
                            style: const TextStyle(
                              color: BLACK_COLOR,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: highlights[index],
                            style: const TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: titles[index].split(highlights[index]).last,
                            style: const TextStyle(
                              color: BLACK_COLOR,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    // 부가 설명
                    Text(
                      '  ${descriptions[index]}',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
