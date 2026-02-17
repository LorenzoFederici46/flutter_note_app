import 'package:flutter/material.dart';
import 'package:note_app/model/recipe.dart';

class AddRecipeDialog extends StatefulWidget {
  @override
  State<AddRecipeDialog> createState() => _AddRecipeDialogState();
}

class _AddRecipeDialogState extends State<AddRecipeDialog> {
  late TextEditingController imageUrlController;
  late TextEditingController nomeController;
  late TextEditingController ingredientiController;
  late TextEditingController procedimentoController;

  @override
  void initState() {
    super.initState();
    imageUrlController = TextEditingController();
    nomeController = TextEditingController();
    ingredientiController = TextEditingController();
    procedimentoController = TextEditingController();
  }

  @override
  void dispose() {
    imageUrlController.dispose();
    nomeController.dispose();
    ingredientiController.dispose();
    procedimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text('Inserisci una nuova ricetta'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                labelText: "URL Immagine",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nome Ricetta",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ingredientiController,
              decoration: InputDecoration(
                labelText: "Ingredienti",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            TextField(
              controller: procedimentoController,
              decoration: InputDecoration(
                labelText: "Procedimento",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Annulla"),
          ),
          ElevatedButton(
            onPressed: () {
              final recipe = Recipe(
                imageUrl: imageUrlController.text,
                nome: nomeController.text,
                ingredienti: ingredientiController.text,
                procedimento: procedimentoController.text,
              );

              Navigator.of(context).pop(recipe);
            },
            child: Text("Salva"),
          ),
        ],
      ),
    );
  }
}
