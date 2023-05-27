import 'package:flutter/material.dart';
import 'package:taw_mvvm/data/entities/food.dart';

class FoodCard extends StatelessWidget {
  final Food f;
  const FoodCard({super.key, required this.f});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: ListTile(
          title: Text(
            f.name.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Calories: ${f.calories}cal"),
              Text("Total Protein: ${f.proteinG}g"),
              Text("Total Fat: ${f.fatG}g"),
              Text("Total Carbs: ${f.carbG}g"),
            ],
          ),
        ));
  }
}
