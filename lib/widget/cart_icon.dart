import 'package:flutter/material.dart';

class CartIcon extends StatefulWidget {
  CartIcon({@required this.color, @required this.count});

  Color color;
  int count;

  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CartIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count < widget.count) {
      controller.forward().then((_) => controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultIconSize = IconTheme.of(context).size;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Container(
        width: animation.value * 14 + defaultIconSize,
        height: animation.value * 14 + defaultIconSize,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Stack(alignment: Alignment.center, children: [
            Icon(
              Icons.shopping_cart,
              color: widget.color,
            ),
            Positioned(
              child: Text(
                '${widget.count}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              bottom: 8,
            ),
          ]),
        ),
      ),
    );
  }
}
