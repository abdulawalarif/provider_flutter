import 'package:flutter/material.dart';
import 'package:food_list_app/providers/cart.dart';
import 'package:food_list_app/screens/cart_screen.dart';
import 'package:food_list_app/widgets/app_drawer.dart';
import 'package:food_list_app/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/foods_grid.dart';

class FoodsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Order'),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, chid) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: FoodsGrid(),
    );
  }
}
