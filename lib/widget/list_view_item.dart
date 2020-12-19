import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/item.dart';
import 'package:flutter_ec_sample/page/item_detail.dart';
import 'package:intl/intl.dart';

class ListViewItemWidget extends StatelessWidget {
  ListViewItemWidget(this.item, {this.onTap});

  Item item;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('Item__${item.id}'),
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 140,
                height: 180,
                child: Placeholder(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      buildRateStar(item.rate),
                      Text(
                        NumberFormat.simpleCurrency().format(item.price),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildRateStar(double rate) {
    List<Widget> stars = [];
    for (; 0 < rate; rate--) {
      if (1 <= rate) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_half));
      }
    }

    for (int i = 0; i < 5 - stars.length; i++) {
      stars.add(Icon(Icons.star_border));
    }

    return Row(
      children: <Widget>[...stars],
    );
  }
}
