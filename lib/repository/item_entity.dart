class ItemEntity {
  String name;
  String iconImageUrl;
  List<String> imageUrls;
  double rate;
  int price;
  double pointPercent;
  bool isPrime;

  ItemEntity({
    required this.name,
    required this.iconImageUrl,
    required this.imageUrls,
    required this.rate,
    required this.price,
    required this.pointPercent,
    required this.isPrime,
  });
}
