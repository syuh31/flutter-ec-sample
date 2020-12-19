import 'package:flutter/material.dart';
import 'package:flutter_ec_sample/model/item_manager.dart';
import 'package:flutter_ec_sample/model/user_manager.dart';
import 'package:flutter_ec_sample/repository/item.dart';
import 'package:flutter_ec_sample/root.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EcSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'ja_JP';

    final itemRepository = LocalItemRepository();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ItemManager(itemRepository)..fetchItems()),
        ChangeNotifierProvider(
            create: (_) => UserManager(itemRepository)..fetchCartItems()),
      ],
      child: MaterialApp(
        home: RootPage(),
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          iconTheme: const IconThemeData.fallback().copyWith(
            color: Colors.cyan[800],
          ),
        ),
      ),
    );
  }
}
