import 'package:meat_dictionary/meat/model/meat_model.dart';

class MeatIdentifier {
  final MeatType type;
  final String name;

  MeatIdentifier(this.type, this.name);

  // JSON 형태로 변환
  Map<String, dynamic> toJson() {
    return {
      'type': type.toString(), // 'MeatType.pork' 같은 문자열로 저장
      'name': name,
    };
  }

  // JSON 형태에서 객체로 복원
  factory MeatIdentifier.fromJson(Map<String, dynamic> json) {
    final type = MeatType.values.firstWhere(
      (e) => e.toString() == json['type'],
    );
    return MeatIdentifier(type, json['name']);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeatIdentifier && other.type == type && other.name == name;
  }

  @override
  int get hashCode => type.hashCode ^ name.hashCode;
}
