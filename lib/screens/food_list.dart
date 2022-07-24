import 'package:flutter/material.dart';
import 'package:food_list_app/providers/foods.dart';
import 'package:food_list_app/screens/add_item.dart';
import 'package:food_list_app/widgets/user_food_item.dart';
import 'package:provider/provider.dart';

class FoodListScreen extends StatelessWidget {
  static const routeName = '/food-list';

  @override
  Widget build(BuildContext context) {
    final foodsData = Provider.of<Foods>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Foods"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddItem.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      //drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: foodsData.items.length,
            itemBuilder: (_, i) => Column(
                  children: [
                    UserFoodItem(
                      foodsData.items[i],
                    ),
                    Divider(),
                  ],
                )),
      ),
    );
  }
}
