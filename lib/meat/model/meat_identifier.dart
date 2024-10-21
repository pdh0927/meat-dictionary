import 'package:json_annotation/json_annotation.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';

part 'meat_identifier.g.dart';

// 고기 식별자
@JsonSerializable()
class MeatIdentifier {
  final MeatType type;
  final String name;

  MeatIdentifier(this.type, this.name);

  // JSON 형태로 변환
  factory MeatIdentifier.fromJson(Map<String, dynamic> json) =>
      _$MeatIdentifierFromJson(json); // 자동 생성된 함수 호출

  Map<String, dynamic> toJson() => _$MeatIdentifierToJson(this); // 자동 생성된 함수 호출

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeatIdentifier && other.type == type && other.name == name;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode;
}
