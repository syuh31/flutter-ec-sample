import 'package:flutter_ec_sample/repository/item_entity.dart';
import 'package:uuid/uuid.dart';

class Item {
  String id;
  String name;
  String iconImageUrl;
  List<String> imageUrls;
  double rate;
  int price;
  double pointPercent;
  bool isPrime;

  Item({
    String id,
    this.name,
    this.iconImageUrl,
    this.imageUrls,
    this.rate,
    this.price,
    this.pointPercent,
    this.isPrime,
  }) : id = id ?? Uuid().v4();

  ItemEntity toEntity() {
    return ItemEntity(
      name: name,
      iconImageUrl: iconImageUrl,
      imageUrls: imageUrls,
      rate: rate,
      price: price,
      pointPercent: pointPercent,
      isPrime: isPrime,
    );
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      name: entity.name,
      iconImageUrl: entity.iconImageUrl,
      imageUrls: entity.imageUrls,
      rate: entity.rate,
      price: entity.price,
      pointPercent: entity.pointPercent,
      isPrime: entity.isPrime,
    );
  }
}
