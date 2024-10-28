import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/model/card_news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 카드뉴스 리스트 provider
final cardNewsListProvider =
    StateNotifierProvider<CardNewsListNotifier, List<CardNewsModel>>((ref) {
  return CardNewsListNotifier();
});

class CardNewsListNotifier extends StateNotifier<List<CardNewsModel>> {
  CardNewsListNotifier() : super([]) {
    fetchCardNews();
  }

  DocumentSnapshot? _lastDocument; // 페이지네이션에 사용할 마지막 문서
  bool _isFetching = false; // 중복 호출 방지 플래그
  bool isLastPage = false; // 마지막 페이지 여부

  // 카드뉴스 가져오기
  Future<void> fetchCardNews() async {
    if (_isFetching || isLastPage) return; // 중복 호출 방지 로직
    _isFetching = true;

    const int pageSize = 8; // 한 번에 불러올 문서 수

    try {
      Query query = FirebaseFirestore.instance
          .collection('card-news')
          .orderBy('createdAt', descending: true)
          .limit(pageSize);

      if (_lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final querySnapshot = await query.get();

      // 새로 가져온 데이터들을 모델 리스트로 변환하고 URL을 변환
      final List<CardNewsModel> cardNewsList = querySnapshot.docs
          .map((doc) => CardNewsModel.fromFirestore(doc))
          .toList();

      // 마지막 페이지 여부 체크
      if (querySnapshot.docs.isNotEmpty)
      // 가져온 데이터가 있다면
      {
        // 마지막 문서 업데이트
        _lastDocument = querySnapshot.docs.last;

        if (querySnapshot.docs.length < pageSize)
        // 마지막 페이지가 맞다면
        {
          isLastPage = true;
        }
      } else {
        isLastPage = true;
      }

      // 기존 상태에 새로운 데이터 추가
      state = [...state, ...cardNewsList];
    } catch (e) {
      print('Error fetching card news: $e');
    } finally {
      _isFetching = false;
    }
  }

  // 추가 데이터 가져오기
  bool fetchMoreData() {
    if (!isLastPage) {
      fetchCardNews();
      return false;
    }
    return true; // 마지막 페이지일 경우 true 반환
  }
}
