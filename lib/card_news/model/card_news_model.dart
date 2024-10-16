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
}
