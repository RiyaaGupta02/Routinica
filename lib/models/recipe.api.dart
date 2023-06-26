//creting here RecipeApi class file
import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  // getRecipe() function creating
  static Future<List<Recipe>> getRecipe() async {
    //creating var uri & put here authoritiy name i.e yummy one & also the unencode path to api path
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    // noe comes the reponse var
    final response = await http.get(uri, headers: {
      // placing here ur own api key now
      "x-rapidapi-key": '8b97ea8234msh1bc40247dbc6d82p1cd909jsn51f2e6478b1a',
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    // finally returning the recipe from the snapshot function
    return Recipe.recipesFromSnapshot(_temp);
  }
}
