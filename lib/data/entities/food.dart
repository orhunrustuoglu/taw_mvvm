class Food {
  final String name;
  final double calories, proteinG, fatG, carbG;

  Food({
    required this.name,
    required this.calories,
    required this.proteinG,
    required this.fatG,
    required this.carbG,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json["name"],
      calories: json["calories"],
      proteinG: json["protein_g"],
      fatG: json["fat_total_g"],
      carbG: json["carbohydrates_total_g"],
    );
  }
}
