import 'package:cloud_firestore/cloud_firestore.dart';

class CardNewsModel {
  String id;
  String title;
  DateTime createdAt;
  List<String> urls;

  CardNewsModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.urls,
  });

  /// Firestore에서 가져온 데이터를 CardNewsModel로 변환하는 메서드
  factory CardNewsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CardNewsModel(
      id: doc.id,
      title: data['title'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      urls: List<String>.from(data['urls'] ?? []),
    );
  }
}
