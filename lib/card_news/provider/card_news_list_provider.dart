import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/model/card_news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  bool get isFetching => _isFetching;

  static const int _pageSize = 6; // 한 번에 불러올 문서 수

  Future<void> fetchCardNews() async {
    if (_isFetching) return; // 중복 호출 방지
    _isFetching = true;

    try {
      Query query = FirebaseFirestore.instance
          .collection('card-news')
          .orderBy('createdAt', descending: true)
          .limit(_pageSize);

      if (_lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final querySnapshot = await query.get();

      // 새로 가져온 데이터들을 모델 리스트로 변환하고 URL을 변환
      final List<CardNewsModel> cardNewsList = await Future.wait(
        querySnapshot.docs.map((doc) async {
          final cardNews = CardNewsModel.fromFirestore(doc);
          final urls = await _convertGsUrlsToDownloadUrls(cardNews.urls);
          return CardNewsModel(
            id: cardNews.id,
            title: cardNews.title,
            createdAt: cardNews.createdAt,
            urls: urls,
          );
        }).toList(),
      );

      if (querySnapshot.docs.isNotEmpty) {
        _lastDocument = querySnapshot.docs.last;
      }

      // 기존 상태에 새로운 데이터 추가
      state = [...state, ...cardNewsList];
    } catch (e) {
      print('Error fetching card news: $e');
    } finally {
      _isFetching = false;
    }
  }

  // gs:// 경로를 다운로드 가능한 URL로 변환하는 함수
  Future<List<String>> _convertGsUrlsToDownloadUrls(List<String> gsUrls) async {
    try {
      return await Future.wait(
        gsUrls.map((url) async {
          final ref = FirebaseStorage.instance.refFromURL(url);
          return await ref.getDownloadURL();
        }),
      );
    } catch (e) {
      print('Error converting URLs: $e');
      return [];
    }
  }
}
