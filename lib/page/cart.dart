import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/user_manager.dart';
import 'package:flutter_ec_sample/page/item_detail.dart';
import 'package:flutter_ec_sample/widget/list_view_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildItemView(context)),
        ],
      ),
    );
  }

  Widget buildItemView(BuildContext context) {
    final items = context.select((UserManager userMgr) => userMgr.cartItems);
    return ListView(
      children: [
        ...items.map((item) => ListViewItemWidget(
              item,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemDetailPage(item)));
              },
            )),
      ],
    );
  }
}
