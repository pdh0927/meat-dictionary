import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';

class HorizontalImages extends StatelessWidget {
  const HorizontalImages({
    super.key,
    required this.imagePaths,
    required this.titles,
    required this.highlights,
    required this.descriptions,
  });

  final List<String> imagePaths;
  final List<String> titles;
  final List<String> highlights;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(imagePaths.length, (index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? 16 : 0, left: 16.0),
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
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.contain,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.fill,
                        width: 180,
                        height: 120,
                      ),
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
