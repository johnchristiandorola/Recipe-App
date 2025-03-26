import 'package:flutter/material.dart';
import 'package:food_recipe/api/recipe_model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          recipe.name,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer),

                            Text(
                              recipe.cookTimeMinutes != 0
                                  ? recipe.cookTimeMinutes.toString()
                                  : recipe.prepTimeMinutes.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                              ),
                            ),
                            Text(' min'),
                          ],
                        ),
                      ],
                    ),
                    Text(recipe.mealType[0]),
                    SizedBox(height: 20),
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(recipe.ingredients.length, (
                          index,
                        ) {
                          return Text(' - ' + recipe.ingredients[index]);
                        }),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(recipe.instructions.length, (
                          index,
                        ) {
                          return Text(' - ' + recipe.instructions[index]);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
