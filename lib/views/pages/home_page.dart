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
      appBar: AppBar(title: Text('Recipe App')),
      body: Column(children: [Expanded(child: RecipeCardWidget())]),
    );
  }
}
