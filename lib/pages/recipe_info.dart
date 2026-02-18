import 'package:flutter/material.dart';
import 'package:note_app/model/recipe.dart';

class RecipeInfo extends StatefulWidget {
  final Recipe recipe;
  const RecipeInfo({required this.recipe});

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.recipe.nome),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.recipe.imageUrl,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.image_not_supported, size: 100),
            ),
            SizedBox(height: 16),
            Text("Ingredienti:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(widget.recipe.ingredienti),
            SizedBox(height: 16),
            Text(
              "Procedimento:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(widget.recipe.procedimento),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Chiudi", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
