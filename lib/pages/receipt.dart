import 'package:flutter/material.dart';
import 'package:note_app/model/recipe.dart';
import 'package:note_app/pages/dialog.dart';

class Receipt extends StatefulWidget {
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
        return AlertDialog(
          title: Text(recipe.nome),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  recipe.imageUrl,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.image_not_supported, size: 100),
                ),
                SizedBox(height: 16),
                Text(
                  "Ingredienti:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(recipe.ingredienti),
                SizedBox(height: 16),
                Text(
                  "Procedimento:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(recipe.procedimento),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Chiudi", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  ricette.remove(recipe);
                });
                Navigator.of(context).pop();
              },
              child: Text("Elimina", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
