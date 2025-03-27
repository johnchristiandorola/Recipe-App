import 'package:flutter/material.dart';
import 'package:food_recipe/views/widgets/recipe_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Easy to cook menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 5,
          ),
        ),
        backgroundColor: Colors.red[300],
      ),
      body: Column(children: [Expanded(child: RecipeCardWidget())]),
    );
  }
}
