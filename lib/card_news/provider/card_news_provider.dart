import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/card_news/model/card_news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final randomCardNewsProvider =
    StateNotifierProvider<RandomCardNewsNotifier, CardNewsModel?>((ref) {
  return RandomCardNewsNotifier();
});

class RandomCardNewsNotifier extends StateNotifier<CardNewsModel?> {
  RandomCardNewsNotifier() : super(null) {
    fetchRandomCardNews();
  }

  /// 랜덤한 문서 하나를 가져오고, URL을 변환해 상태에 저장하는 메서드
  Future<void> fetchRandomCardNews() async {
    try {
      // 랜덤한 문자열 생성
      final randomString = _generateRandomString(5);

      // 랜덤 문자열 이후의 첫 번째 문서를 가져옵니다.
      final querySnapshot = await FirebaseFirestore.instance
          .collection('card-news')
          .orderBy(FieldPath.documentId)
          .startAt([randomString])
          .limit(1)
          .get();

      DocumentSnapshot? selectedDoc;

      // 문서가 없을 경우 첫 번째 문서를 가져옵니다.
      if (querySnapshot.docs.isEmpty) {
        final fallbackSnapshot = await FirebaseFirestore.instance
            .collection('card-news')
            .orderBy(FieldPath.documentId)
            .limit(1)
            .get();

        if (fallbackSnapshot.docs.isNotEmpty) {
          selectedDoc = fallbackSnapshot.docs.first;
        }
      } else {
        selectedDoc = querySnapshot.docs.first;
      }

      if (selectedDoc != null) {
        // Firestore 문서를 모델로 변환하고 URL을 변환
        final cardNews = await _convertUrlsToDownloadUrls(
          CardNewsModel.fromFirestore(selectedDoc),
        );

        // 상태 업데이트
        state = cardNews;
      }
    } catch (e) {
      print('Error fetching random card news: $e');
    }
  }

  /// 주어진 길이의 랜덤 문자열 생성 (a-z, 0-9 포함)
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

  /// CardNewsModel의 URLs을 다운로드 가능한 URL로 변환
  Future<CardNewsModel> _convertUrlsToDownloadUrls(
      CardNewsModel cardNews) async {
    final downloadUrls = await Future.wait(
      cardNews.urls.map((url) async {
        final ref = FirebaseStorage.instance.refFromURL(url);

        return await ref.getDownloadURL();
      }),
    );

    return CardNewsModel(
      id: cardNews.id,
      title: cardNews.title,
      createdAt: cardNews.createdAt,
      urls: downloadUrls,
    );
  }
}
