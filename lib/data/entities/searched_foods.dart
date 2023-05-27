import '/data/entities/food.dart';

class SearchedFoods {
  List<Food> searchedFoods;

  SearchedFoods({required this.searchedFoods});

  factory SearchedFoods.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["items"] as List;
    return SearchedFoods(
      searchedFoods: jsonArray.map((f) => Food.fromJson(f)).toList(),
    );
  }
}
