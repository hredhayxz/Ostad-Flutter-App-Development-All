import 'dart:convert';

import 'package:flutter/material.dart';

import 'Recipe.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    String jsonText = '''
      {
        "recipes": [
          {
            "title": "Pasta Carbonara",
            "description": "Creamy pasta dish with bacon and cheese.",
            "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
          },
          {
            "title": "Caprese Salad",
            "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
            "ingredients": ["tomatoes", "mozzarella", "basil"]
          },
          {
            "title": "Banana Smoothie",
            "description": "Healthy and creamy smoothie with bananas and milk.",
            "ingredients": ["bananas", "milk"]
          },
          {
            "title": "Chicken Stir-Fry",
            "description": "Quick and flavorful stir-fried chicken with vegetables.",
            "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
          },
          {
            "title": "Grilled Salmon",
            "description": "Delicious grilled salmon with lemon and herbs.",
            "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
          },
          {
            "title": "Vegetable Curry",
            "description": "Spicy and aromatic vegetable curry.",
            "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
          },
          {
            "title": "Berry Parfait",
            "description": "Layered dessert with fresh berries and yogurt.",
            "ingredients": ["berries", "yogurt", "granola"]
          }
        ]
      }
    ''';

    Map<String, dynamic> json = jsonDecode(jsonText);

    List<dynamic> recipeList = json['recipes'];

    setState(() {
      recipes = recipeList.map((item) => Recipe.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const Icon(Icons.fastfood),
            title: Text(recipes[index].title),
            subtitle: Text(recipes[index].description),
          );
        },
      ),
    );
  }
}