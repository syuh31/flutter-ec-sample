import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/item_manager.dart';
import 'package:flutter_ec_sample/page/item_detail.dart';
import 'package:flutter_ec_sample/widget/list_view_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildItemView(context)),
        ],
      ),
    );
  }

  Widget buildItemView(BuildContext context) {
    final items = context.select((ItemManager itemMgr) => itemMgr.items);
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListViewItemWidget(
          items[index],
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemDetailPage(items[index])));
          },
        );
      },
      itemCount: items.length,
    );
  }
}
