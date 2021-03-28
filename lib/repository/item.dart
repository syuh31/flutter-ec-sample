import 'dart:async';
import 'dart:core';

import 'package:flutter_ec_sample/repository/item_entity.dart';

abstract class ItemRepository {
  Future<List<ItemEntity>> fetchItems();
  Future<List<ItemEntity>> fetchCartItems();
  Future<void> addCartItems(List<ItemEntity> items);
}

class LocalItemRepository implements ItemRepository {
  List<ItemEntity> items;
  List<ItemEntity> cartItems;

  LocalItemRepository() :
    items = [
      ItemEntity(
        name:
            'very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item',
        iconImageUrl: 'assets/image/1280x800.jpg',
        imageUrls: [
          'assets/image/800x1280.jpg',
          'assets/image/1280x800.jpg',
          'assets/image/1440x1920.jpg',
          'assets/image/1920x1440.jpg',
        ],
        rate: 4,
        price: 12000,
        pointPercent: 1,
        isPrime: true,
      ),
      ItemEntity(
        name: 'item2',
        iconImageUrl: 'assets/image/800x1280.jpg',
        imageUrls: [
          'assets/image/800x1280.jpg',
          'assets/image/1280x800.jpg',
          'assets/image/1440x1920.jpg',
          'assets/image/1920x1440.jpg',
        ],
        rate: 3.5,
        price: 2000,
        pointPercent: 1,
        isPrime: true,
      ),
    ],
    cartItems = [
      ItemEntity(
        name:
            'very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item',
        iconImageUrl: 'assets/image/1280x800.jpg',
        imageUrls: [
          'assets/image/800x1280.jpg',
          'assets/image/1280x800.jpg',
          'assets/image/1440x1920.jpg',
          'assets/image/1920x1440.jpg',
        ],
        rate: 4,
        price: 12000,
        pointPercent: 1,
        isPrime: true,
      ),
      ItemEntity(
        name: 'item2',
        iconImageUrl: 'assets/image/800x1280.jpg',
        imageUrls: [
          'assets/image/800x1280.jpg',
          'assets/image/1280x800.jpg',
          'assets/image/1440x1920.jpg',
          'assets/image/1920x1440.jpg',
        ],
        rate: 3.5,
        price: 2000,
        pointPercent: 1,
        isPrime: true,
      ),
    ];

  @override
  Future<List<ItemEntity>> fetchItems() {
    return Future.value(items);
  }

  @override
  Future<List<ItemEntity>> fetchCartItems() {
    return Future.value(cartItems);
  }

  @override
  Future<void> addCartItems(List<ItemEntity> items) {
    cartItems.addAll(items);
    return Future.value();
  }
}
