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

  final _formKey = GlobalKey<FormState>();

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
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: imageUrlController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci un URL valido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "URL Immagine",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Importante inserire un nome per la ricetta';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nome Ricetta",
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: ingredientiController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci almeno un ingrediente';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Ingredienti",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: procedimentoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci il procedimento';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Procedimento",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
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
