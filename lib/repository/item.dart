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

  LocalItemRepository() {
    items = [
      ItemEntity(
        name:
            'very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item',
        imageUrls: [],
        rate: 4,
        price: 12000,
        pointPercent: 1,
        isPrime: true,
      ),
      ItemEntity(
        name: 'item2',
        imageUrls: [],
        rate: 3.5,
        price: 2000,
        pointPercent: 1,
        isPrime: true,
      ),
    ];

    cartItems = [
      ItemEntity(
        name:
            'very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item very long name item',
        imageUrls: [],
        rate: 4,
        price: 12000,
        pointPercent: 1,
        isPrime: true,
      ),
      ItemEntity(
        name: 'item2',
        imageUrls: [],
        rate: 3.5,
        price: 2000,
        pointPercent: 1,
        isPrime: true,
      ),
    ];
  }

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
