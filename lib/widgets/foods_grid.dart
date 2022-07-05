import 'package:flutter/material.dart';
import 'package:food_list_app/widgets/food_tem.dart';
import '../providers/foods.dart';

class FoodGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Foods();
    final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => FoodItem(
        id: products[i].id,
        title: products[i].title,
        description: products[i].description,
        price: products[i].price,
        imageUrl: products[i].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
