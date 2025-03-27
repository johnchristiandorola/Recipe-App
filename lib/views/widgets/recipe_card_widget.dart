import 'package:flutter/material.dart';
import 'package:food_recipe/api/recipe_model.dart';
import 'package:food_recipe/api/services.dart';
import 'package:food_recipe/views/pages/recipe_details_page.dart';

class RecipeCardWidget extends StatefulWidget {
  const RecipeCardWidget({super.key});

  @override
  State<RecipeCardWidget> createState() => _RecipeCardWidgetState();
}

class _RecipeCardWidgetState extends State<RecipeCardWidget> {
  List<Recipe> recipeModel = [];
  bool isLoading = false;
  myRecipes() {
    isLoading = true;
    recipeItems().then((value) {
      setState(() {
        recipeModel = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    myRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
          shrinkWrap: true,
          itemCount: recipeModel.length,
          itemBuilder: (context, index) {
            final recipes = recipeModel[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailsPage(recipe: recipes),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(recipes.image),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(-5, 10),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                recipes.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(Icons.timer, color: Colors.red[300]),
                            Text(
                              recipes.cookTimeMinutes != 0
                                  ? recipes.cookTimeMinutes.toString()
                                  : recipes.prepTimeMinutes.toString(),
                            ),
                            Text(" mins"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
