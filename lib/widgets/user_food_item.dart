import 'package:flutter/material.dart';
import 'package:food_list_app/providers/food.dart';
import 'package:food_list_app/providers/foods.dart';
import 'package:food_list_app/screens/edit_item.dart';
import 'package:provider/provider.dart';

class UserFoodItem extends StatelessWidget {
  Food food;
  UserFoodItem(this.food);

  void removeAFood(BuildContext context) {
    var foodList = Provider.of<Foods>(context, listen: false);
    foodList.removeAFoodItem(food.id);
    print("A Food is deleted");
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(food.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(food.imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditItem.routeName, arguments: food);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                removeAFood(context);
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
