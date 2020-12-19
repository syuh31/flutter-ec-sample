import 'package:flutter/widgets.dart';
import 'package:flutter_ec_sample/model/item.dart';
import 'package:flutter_ec_sample/repository/item.dart';

class ItemManager extends ChangeNotifier {
  ItemManager(this._itemRepository);

  ItemRepository _itemRepository;

  dynamic error;
  List<Item> _items = [];
  List<Item> get items => _items;

  Future<void> fetchItems() {
    return _itemRepository.fetchItems().then((itemEntities) {
      _items = itemEntities.map(Item.fromEntity).toList();
      notifyListeners();
    }).catchError((e) {
      error = e;
    });
  }
}
