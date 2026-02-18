import 'package:flutter/material.dart';
import 'package:note_app/pages/labeled_checkbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;
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
        child: LabeledCheckbox(
          label: 'Flutter is awesome!',
          value: isSelected,
          onChanged: (bool newValue) {
            setState(() {
              isSelected = newValue;
            });
          },
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
