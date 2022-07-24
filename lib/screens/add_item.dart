import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/food.dart';
import '../providers/foods.dart';

class AddItem extends StatefulWidget {
  static const routeName = '/addItem';

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  late String xyz;
  late Foods foodList;

  final _keyForm = GlobalKey<FormState>();

  final itemNameController = TextEditingController();
  final itemDescController = TextEditingController();
  final itemPriceController = TextEditingController();
  final itemUrlController = TextEditingController();

  void saveItemToList() {
    print("This is working ${itemUrlController.text}");

    if (_keyForm.currentState!.validate()) {
      Food food = Food(
        id: '',
        title: itemNameController.text,
        description: itemDescController.text,
        price: double.parse(itemPriceController.text),
        imageUrl: itemUrlController.text,
      );
      foodList.addFood(food);
      itemNameController.text = '';
      itemDescController.text = '';
      itemPriceController.text = '';
      itemUrlController.text = '';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully Saved Item"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    foodList = Provider.of<Foods>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
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
                  saveItemToList();
                },
                child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
