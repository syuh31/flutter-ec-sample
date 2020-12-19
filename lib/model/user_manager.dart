import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter_ec_sample/model/item.dart';
import 'package:flutter_ec_sample/repository/item.dart';

class UserManager extends ChangeNotifier {
  UserManager(this._itemRepository);

  ItemRepository _itemRepository;

  dynamic error;
  List<Item> _cartItems = [];
  List<Item> get cartItems => _cartItems;

  Future<void> addItemToCart(Item item) {
    return _itemRepository
        .addCartItems([item.toEntity()]).then((_) => fetchCartItems());
  }

  Future<void> fetchCartItems() {
    return _itemRepository.fetchCartItems().then((itemEntities) {
      _cartItems = itemEntities.map(Item.fromEntity).toList();
      notifyListeners();
    }).catchError((e) {
      error = e;
    });
  }
}
