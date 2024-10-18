import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/component/slide_card_news_widget.dart';
import 'package:meat_dictionary/card_news/provider/card_news_list_provider.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CardNewsScreen extends ConsumerStatefulWidget {
  const CardNewsScreen({super.key});

  @override
  ConsumerState<CardNewsScreen> createState() => _CardNewsScreenState();
}

class _CardNewsScreenState extends ConsumerState<CardNewsScreen> {
  bool isLastPage = false; // 마지막 페이지 인지
  final ScrollController _scrollController = ScrollController();
  bool? isFetching = true; // null이면 fetching 중, null이 아니면 fetching 완료

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0 && !isLastPage) {
        // 스크롤의 끝에 도달
        setState(() {
          isFetching = null;
          isLastPage = ref.read(cardNewsListProvider.notifier).fetchMoreData();
          isFetching = isLastPage;
          print(isLastPage);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardNewsList = ref.watch(cardNewsListProvider);

    return DefaultLayout(
      title: '카드뉴스',
      backgroundColor: const Color(0xFFF0F0F0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xFFE4E4E4),
              ),

              // 카드 뉴스 목록
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1,
                    ),
                    itemCount: cardNewsList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < cardNewsList.length) {
                        final cardNews = cardNewsList[index];

                        return InkWell(
                          onTap: () {
                            showCardNewsPopup(context, cardNews.urls);
                          },
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: double.infinity,
                            imageUrl: cardNews.urls.first,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                _buildShimmerPlaceholder(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        );
                      }

                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),

          // 데이터 로딩 중인 경우 중앙에 고정된 로딩 인디케이터
          if (isFetching == null || cardNewsList.isEmpty)
            const Center(
              child: CircularProgressIndicator(color: PRIMARY_COLOR),
            ),
        ],
      ),
    );
  }

  // 팝업 다이얼로그를 띄워 CardNews 노출
  void showCardNewsPopup(BuildContext context, List<String> urls) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10.0),
          child: SlideCardNewsWidget(
            urls: urls,
            isPopup: true,
            width: 100.w,
            height: 100.w,
          ),
        );
      },
    );
  }

  // Shimmer 플레이스홀더
  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.grey[300],
      ),
    );
  }
}
