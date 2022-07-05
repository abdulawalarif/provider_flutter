import 'package:flutter/material.dart';

import '../widgets/foods_grid.dart';

class FoodsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Order'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
          )
        ],
      ),
      body: FoodGrid(),
    );
  }
}
