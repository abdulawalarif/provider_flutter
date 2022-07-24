import 'package:flutter/material.dart';
import 'package:food_list_app/screens/food_list.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('xyz'),
            accountEmail: Text('xyz@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('X'),
            ),
            decoration: BoxDecoration(color: Colors.purple),
            otherAccountsPictures: [
              CircleAvatar(
                child: Text('X'),
              ),
              CircleAvatar(
                child: Text('X'),
              )
            ],
          ),
          ListTile(
            title: Text('Shop'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Shop');
              // Navigator.push(context, MaterialPageRoute(builder: (cnx) {
              //   return Page1();
              // }));
            },
          ),
          ListTile(
            title: Text('Orders'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Orders');
              // Navigator.push(context, MaterialPageRoute(builder: (cnx) {
              //   return Page2();
              // }));
            },
          ),
          ListTile(
            title: Text('Manage Food'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Manage Food');
              Navigator.push(context, MaterialPageRoute(builder: (cnx) {
                return FoodListScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
