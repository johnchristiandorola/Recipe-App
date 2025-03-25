import 'package:flutter/material.dart';
import 'package:food_recipe/api/recipe_model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(recipe.image),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Positioned(
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back, color: Colors.amber),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
