import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/item.dart';
import 'package:flutter_ec_sample/model/user_manager.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatelessWidget {
  ItemDetailPage(this.item);

  Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('カートに入れる'),
            onPressed: () {
              context.read<UserManager>().addItemToCart(item);
            },
          ),
        ],
      ),
    );
  }
}
