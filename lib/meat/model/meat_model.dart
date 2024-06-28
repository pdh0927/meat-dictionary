class MeatModel {
  int id;
  String name;
  String type;
  List<String> usage;
  String description;
  int texture;
  int savoryFlavor;
  int meatAroma;
  int price;
  String imgPath;

  MeatModel({
    required this.id,
    required this.name,
    required this.type,
    required this.usage,
    required this.description,
    required this.texture,
    required this.savoryFlavor,
    required this.meatAroma,
    required this.price,
    required this.imgPath,
  });
}
