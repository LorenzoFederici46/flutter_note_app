import 'package:flutter/material.dart';
import 'package:note_app/model/recipe.dart';
import 'package:note_app/components/dialog.dart';
import 'package:note_app/components/recipe_info.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  State<StatefulWidget> createState() => ReceiptState();
}

class ReceiptState extends State<Receipt> {
  List<Recipe> ricette = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade400, // arancione chiaro
              Colors.orange.shade900, // arancione scuro
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: ricette.length,
          itemBuilder: (context, index) {
            final recipe = ricette[index];

            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Image.network(
                  recipe.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.image_not_supported),
                ),
                title: Text(recipe.nome),
                subtitle: Text(recipe.ingredienti),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                  onPressed: () {
                    _showRecipeDetails(recipe);
                  },
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
        onPressed: () async {
          final newRecipe = await showDialog<Recipe>(
            context: context,
            builder: (context) => AddRecipeDialog(),
          );

          if (newRecipe != null) {
            setState(() {
              ricette.add(newRecipe);
            });
          }
        },
        child: Text(
          "Aggiungi una ricetta",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showRecipeDetails(Recipe recipe) {
    showDialog(
      context: context,
      builder: (context) {
        return RecipeInfo(recipe: recipe);
      },
    );
  }
}
