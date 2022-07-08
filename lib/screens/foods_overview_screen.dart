import 'package:flutter/material.dart';
import 'package:food_list_app/providers/cart.dart';
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
            builder: (context,cart,child)=> Badge(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
              ),
              value: cart.itemCount.toString(),
              color: Colors.black,
            ),
          )
        ],
      ),
      body: FoodGrid(),
    );
  }
}
