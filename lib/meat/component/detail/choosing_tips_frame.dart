import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';

// 가로 이미지들
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
    return SizedBox(
      height: 168,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? 16 : 0, left: 16.0),
            child: SizedBox(
              height: 180,
              width: 180,
              child: GestureDetector(
                onTap: () {
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
                      text: TextSpan(
                        children: [
                          // 강조 단어 이전 텍스트
                          TextSpan(
                            text:
                                '✔️ ${titles[index].split(highlights[index])[0]}',
                            style: const TextStyle(
                              color: BLACK_COLOR,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // 강조할 단어
                          TextSpan(
                            text: highlights[index],
                            style: const TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // 강조 단어 이후 텍스트
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
        },
      ),
    );
  }
}
