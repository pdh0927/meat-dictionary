import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/model/card_news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meat_dictionary/common/utils/data_utils.dart';

// 랜덤 카드뉴스 provider(홈화면 사용)
final randomCardNewsProvider =
    StateNotifierProvider<RandomCardNewsNotifier, CardNewsModel?>((ref) {
  return RandomCardNewsNotifier();
});

class RandomCardNewsNotifier extends StateNotifier<CardNewsModel?> {
  RandomCardNewsNotifier() : super(null) {
    fetchRandomCardNews();
  }

  // 랜덤한 카드뉴스를 하나를 가져오고, URL을 변환해 상태에 저장
  Future<void> fetchRandomCardNews() async {
    try {
      // 랜덤한 문자열 생성
      final randomString = _generateRandomString(5);

      // 랜덤 문자열 이후의 첫 번째 카드뉴스를 가져옴
      final querySnapshot = await FirebaseFirestore.instance
          .collection('card-news')
          .orderBy(FieldPath.documentId)
          .startAt([randomString])
          .limit(1)
          .get();

      DocumentSnapshot? selectedDoc;

      if (querySnapshot.docs.isEmpty) {
        // 랜덤 카드뉴스가 없을 경우 가장 최신 카드뉴스를 가져옴
        final fallbackSnapshot = await FirebaseFirestore.instance
            .collection('card-news')
            .orderBy('createdAt', descending: true)
            .limit(1)
            .get();

        if (fallbackSnapshot.docs.isNotEmpty) {
          selectedDoc = fallbackSnapshot.docs.first;
        }
      } else {
        // 랜덤 카드뉴스가 존재한다면 랜덤 카드뉴스 사용
        selectedDoc = querySnapshot.docs.first;
      }

      if (selectedDoc != null) {
        // Firestore 문서를 모델로 변환하고 URL을 변환
        final CardNewsModel randomCardNews =
            CardNewsModel.fromFirestore(selectedDoc);
        final downloadUrls = await DataUtils.convertMultipleGsToDownloadUrls(
            randomCardNews.urls);

        // 상태 업데이트
        state = randomCardNews.copyWith(urls: downloadUrls);
      }
    } catch (e) {
      print('Error fetching random card news: $e');
    }
  }

  // 주어진 길이의 랜덤 문자열 생성 (a-z, 0-9 포함)
  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rand.nextInt(chars.length)),
      ),
    );
  }
}
