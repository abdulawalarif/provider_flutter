import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/food.dart';
import '../providers/foods.dart';

class EditItem extends StatefulWidget {
  static const routeName = '/editItem';

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late String xyz;
  late Foods foodList;
  late Food food;

  final _keyForm = GlobalKey<FormState>();

  final itemNameController = TextEditingController();
  final itemDescController = TextEditingController();
  final itemPriceController = TextEditingController();
  final itemUrlController = TextEditingController();

  void updateItemToList() {
    print("This is working ${itemUrlController.text}");

    if (_keyForm.currentState!.validate()) {
      food.title = itemNameController.text;
      food.description = itemDescController.text;
      food.price = double.parse(itemPriceController.text);
      food.imageUrl = itemUrlController.text;

      foodList.updateFood(food);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully Updated Item"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    foodList = Provider.of<Foods>(context);
    food = ModalRoute.of(context)!.settings.arguments as Food;

    itemNameController.text = food.title;
    itemDescController.text = food.description;
    itemPriceController.text = food.price.toString();
    itemUrlController.text = food.imageUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 10,
          bottom: 10,
        ),
        child: Form(
          key: _keyForm,
          child: ListView(
            children: [
              TextFormField(
                controller: itemNameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Item Name',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
                    ),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please Enter item's name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please Enter a Description for your product";
                  } else {
                    return null;
                  }
                },
                controller: itemDescController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Item Description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please Put the price";
                  } else {
                    return null;
                  }
                },
                controller: itemPriceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Item Price',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (cal) {
                  if (cal == null || cal.isEmpty) {
                    return "Please Put URL on the TextFormField ";
                  } else {
                    return null;
                  }
                },
                controller: itemUrlController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Enter Item URL',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  updateItemToList();
                },
                child: Text("Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
