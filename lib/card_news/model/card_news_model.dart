import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_news_model.g.dart';

// 카드뉴스 모델
@JsonSerializable()
class CardNewsModel {
  String id; // 고유 식별자
  String title; // 제목
  DateTime createdAt; // 생성일시
  List<String> urls; // 이미지 링크들

  // 생성자
  CardNewsModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.urls,
  });

  // copyWith 메서드
  CardNewsModel copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    List<String>? urls,
  }) {
    return CardNewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      urls: urls ?? this.urls,
    );
  }

  // Firestore에서 가져온 데이터를 Json으로 변환해 CardNewsModel 생성
  factory CardNewsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CardNewsModel.fromJson({
      'id': doc.id,
      ...data,
      'createdAt': (data['createdAt'] as Timestamp).toDate().toIso8601String(),
    });
  }

  // Json 데이터를 Map<String, dynamic>로 변환
  factory CardNewsModel.fromJson(Map<String, dynamic> json) =>
      _$CardNewsModelFromJson(json);
}
