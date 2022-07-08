import 'package:flutter/material.dart';
import 'package:food_list_app/providers/cart.dart';
import 'package:provider/provider.dart';
import '../providers/food.dart';
import '../screens/food_detail_screen.dart';

class FoodItem extends StatelessWidget {

  FoodItem();

  @override
  Widget build(BuildContext context) {

    //final food = Provider.of<Food>(context, listen: true);
    //print("called build method");

    final cart = Provider.of<Cart>(context, listen: false);

    return Consumer<Food>(
      builder: (context, food, child)=> ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                FoodDetailScreen.routeName,
                arguments: food.id,
              );
            },
            child: Image.asset(
              food.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            leading: IconButton(
              icon: Icon(food.isFavorite?Icons.favorite:Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                  food.toggleFavoriteData();
              },
            ),
            title: Text(
              food.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                cart.addItem(
                    food.id,
                    food.price,
                    food.title,
                );
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
