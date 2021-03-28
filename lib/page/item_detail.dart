import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/item.dart';
import 'package:flutter_ec_sample/model/user_manager.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends StatelessWidget {
  ItemDetailPage(this.item)
      : images = item.imageUrls
            .map((url) => Image.asset(url, fit: BoxFit.scaleDown))
            .toList();

  final Item item;
  final List<Widget> images;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item.name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Carousel(
                      aspectRatio: 1.2,
                      itemBuilder: (context, index) =>
                          images[index % images.length]),
                ),
              ),
              Container(
                color: Colors.green,
                width: double.infinity,
                child: InteractiveViewer(
                    maxScale: 10,
                    child: Image.asset(
                      item.imageUrls[0],
                      fit: BoxFit.scaleDown,
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<UserManager>().addItemToCart(item);
                },
                child: Text('カートに入れる'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double aspectRatio;

  const Carousel({
    required this.aspectRatio,
    required this.itemBuilder,
  });

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _controller;
  int _currentPage;
  bool _pageHasChanged = false;

  _CarouselState() : _currentPage = 0, _controller = PageController(
    viewportFraction: .85,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          _pageHasChanged = true;
          _currentPage = value;
        });
      },
      controller: _controller,
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          var result = _pageHasChanged ? _controller.page : _currentPage * 1.0;
          var value = result! - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) *
                  size.width /
                  widget.aspectRatio,
              width: Curves.easeOut.transform(value) * size.width,
              child: child,
            ),
          );
        },
        child: widget.itemBuilder(context, index),
      ),
    );
  }
}
