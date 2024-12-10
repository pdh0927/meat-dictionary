import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// 슬라이드 카드뉴스 위젯
class SlideCardNewsWidget extends StatefulWidget {
  final List<String> urls;
  final bool isPopup;
  final double width;
  final double height;

  const SlideCardNewsWidget({
    super.key,
    required this.urls,
    required this.isPopup,
    required this.width,
    required this.height,
  });

  @override
  State<SlideCardNewsWidget> createState() => _SlideCardNewsWidgetState();
}

class _SlideCardNewsWidgetState extends State<SlideCardNewsWidget> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urls = widget.urls;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // 카드뉴스 내용
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: urls.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: urls[index],
                fit: BoxFit.fill,
                width: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.grey[300],
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
              );
            },
          ),
        ),

        // 하단 페이지뷰 인디케이터
        Positioned(
          bottom: 16.0,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: urls.length,
            effect: const WormEffect(
              dotWidth: 8.0,
              dotHeight: 8.0,
              activeDotColor: PRIMARY_COLOR,
              dotColor: Colors.white,
            ),
          ),
        ),

        // close 버튼 (팝업 모드일 때만 표시)
        if (widget.isPopup)
          Positioned(
            top: 5.0,
            right: 5.0,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
      ],
    );
  }
}
