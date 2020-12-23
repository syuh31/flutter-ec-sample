class ItemEntity {
  String name;
  String iconImageUrl;
  List<String> imageUrls;
  double rate;
  int price;
  double pointPercent;
  bool isPrime;

  ItemEntity({
    this.name,
    this.iconImageUrl,
    this.imageUrls,
    this.rate,
    this.price,
    this.pointPercent,
    this.isPrime,
  });
}
