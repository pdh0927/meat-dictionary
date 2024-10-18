import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/component/slide_card_news_widget.dart';
import 'package:meat_dictionary/card_news/provider/card_news_list_provider.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// 카드 뉴스 스크린
class CardNewsScreen extends ConsumerWidget {
  const CardNewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardNewsList = ref.watch(cardNewsListProvider);

    return DefaultLayout(
      backgroundColor: const Color(0xFFF0F0F0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10.0),
            // 제목
            const Text(
              '카드 뉴스',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15.0),
            const Divider(
              height: 0.0,
              thickness: 1.0,
              color: Color(0xFFE4E4E4),
            ),

            // 카드 뉴스 목록 (GridView)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent) {
                      // 페이지네이션 호출
                      ref.read(cardNewsListProvider.notifier).fetchCardNews();
                    }
                    return false;
                  },
                  child: ref.watch(cardNewsListProvider.notifier).isFetching
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: PRIMARY_COLOR,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: cardNewsList.length,
                          itemBuilder: (context, index) {
                            final cardNews = cardNewsList[index];

                            return InkWell(
                              onTap: () {
                                showImageCarouselPopup(context, cardNews.urls);
                              },
                              child: Image.network(
                                cardNews.urls.first, // 첫 번째 이미지 URL 사용
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 팝업 다이얼로그를 띄워 ImageCarousel을 표시하는 함수
  void showImageCarouselPopup(BuildContext context, List<String> urls) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: SlideCardNewsWidget(
              urls: urls,
              isPopup: true,
              width: 100.w,
              height: 100.w,
            ),
          ),
        );
      },
    );
  }

  // Shimmer 효과를 보여주는 위젯
  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
