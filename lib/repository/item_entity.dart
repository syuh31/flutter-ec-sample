class ItemEntity {
  String name;
  List<String> imageUrls;
  double rate;
  int price;
  double pointPercent;
  bool isPrime;

  ItemEntity({
    this.name,
    this.imageUrls,
    this.rate,
    this.price,
    this.pointPercent,
    this.isPrime,
  });
}
