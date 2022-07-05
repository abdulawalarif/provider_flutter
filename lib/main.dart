import 'package:flutter/material.dart';
import 'screens/foods_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.orange,
          fontFamily: 'Lato'),
      home: FoodsOverviewScreen(),
      routes: {
        //FoodDetailScreen.routeName:(context) => FoodDetailScreen();
      },
    );
  }
}
