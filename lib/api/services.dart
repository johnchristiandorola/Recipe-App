import 'package:food_recipe/api/recipe_model.dart';
import 'package:http/http.dart' as http;

recipeItems() async {
  Uri url = Uri.parse('https://dummyjson.com/recipes');
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = recipeModelFromJson(res.body);
      return data.recipes;
    } else {
      print('Error');
    }
  } catch (e) {
    print(e.toString());
  }
}
