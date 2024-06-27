class MeatModel {
  String name;
  String type;
  List<String> usage;
  String description;
  double texture;
  double savoryFlavor;
  double meatAroma;
  double price;
  String imgPath;

  MeatModel({
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
