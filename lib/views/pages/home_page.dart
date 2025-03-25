import 'package:flutter/material.dart';
import 'package:food_recipe/api/recipe_model.dart';
import 'package:food_recipe/api/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeModel = [];
  myRecipes() {
    recipeItems().then((value) {
      setState(() {
        recipeModel = value;
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
    return Scaffold(
      appBar: AppBar(title: Text('Recipe App')),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: recipeModel.length,
        itemBuilder: (context, index) {
          final recipes = recipeModel[index];
          return Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {},
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
