import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/model/card_news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

final randomCardNewsProvider =
    StateNotifierProvider<RandomCardNewsNotifier, CardNewsModel?>((ref) {
  return RandomCardNewsNotifier();
});

class RandomCardNewsNotifier extends StateNotifier<CardNewsModel?> {
  RandomCardNewsNotifier() : super(null) {
    fetchRandomCardNews();
  }

  /// Firestore에서 랜덤한 하나의 문서만 가져오는 메서드
  Future<void> fetchRandomCardNews() async {
    try {
      // 전체 문서 수 조회
      final collection = FirebaseFirestore.instance.collection('card-news');
      final querySnapshot = await collection.get();

      if (querySnapshot.size > 0) {
        // 랜덤한 인덱스 선택
        final randomIndex = Random().nextInt(querySnapshot.size);
        final randomDoc = querySnapshot.docs[randomIndex];

        // 랜덤한 문서를 CardNewsModel로 변환하여 상태에 저장
        state = CardNewsModel.fromFirestore(randomDoc);
      }
    } catch (e) {
      print('Error fetching random card news: $e');
    }
  }
}
