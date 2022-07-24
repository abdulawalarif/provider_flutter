import 'package:flutter/material.dart';
import 'package:food_list_app/providers/cart.dart';
import 'package:food_list_app/providers/foods.dart';
import 'package:food_list_app/screens/add_item.dart';
import 'package:food_list_app/screens/cart_screen.dart';
import 'package:food_list_app/screens/edit_item.dart';
import 'package:provider/provider.dart';
import 'screens/food_detail_screen.dart';
import 'screens/foods_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Foods()),
        ChangeNotifierProvider(create: (_) => Cart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Order',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        home: FoodsOverviewScreen(),
        routes: {
          FoodDetailScreen.routeName: (ctx) => FoodDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          AddItem.routeName: (ctx) => AddItem(),
          EditItem.routeName: (ctx) => EditItem(),
        },
      ),
    );
  }
}
