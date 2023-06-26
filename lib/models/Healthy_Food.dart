import 'package:flutter/material.dart';
import 'package:routinica/models/RecipeCard.dart';
import 'package:routinica/models/recipe.dart';
import 'recipe.api.dart';

class HealthyRecipes extends StatefulWidget {
  // const HealthyRecipes({Key? key}) : super(key: key);

  @override
  State<HealthyRecipes> createState() => _HealthyRecipesState();
}

class _HealthyRecipesState extends State<HealthyRecipes> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  void initState() {
    super.initState();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff913aed),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food recipe')
            ],
          ),
        ),
        // body: RecipeCard(
        //   title: "My recipes",
        //   cookTime: '30 min',
        //   rating: '4.5',
        //   thumbnailUrl:
        //       'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        // ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
