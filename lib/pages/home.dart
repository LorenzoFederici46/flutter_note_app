import 'package:flutter/material.dart';
import 'package:note_app/model/list_item.dart';
import 'package:note_app/pages/labeled_checkbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<ShoppingItem> shoppingList = [];
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    ShoppingItem item1 = ShoppingItem(name: "Pane", quantity: 5);
    ShoppingItem item2 = ShoppingItem(name: "Latte", quantity: 2);
    ShoppingItem item3 = ShoppingItem(name: "Uova", quantity: 12);
    ShoppingItem item4 = ShoppingItem(name: "Pasta", quantity: 1);

    shoppingList = [item1, item2, item3, item4];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade400, Colors.orange.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ListView.builder(
          itemCount: shoppingList.length,
          itemBuilder: (context, index) {
            return LabeledCheckbox(
              label:
                  "${shoppingList[index].name}: ${shoppingList[index].quantity}",
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: shoppingList[index].checked,
              onChanged: (bool newValue) {
                setState(() {
                  shoppingList[index] = ShoppingItem(
                    name: shoppingList[index].name,
                    quantity: shoppingList[index].quantity,
                    checked: newValue,
                  );
                });
              },
            );
          },
        ),
      ),
    );
  }
}
