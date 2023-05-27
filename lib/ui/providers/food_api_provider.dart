import 'package:flutter/material.dart';
import 'package:taw_mvvm/data/entities/searched_foods.dart';
import 'package:taw_mvvm/data/repo/food_api_repository.dart';

class FoodApiProvider with ChangeNotifier {
  SearchedFoods _searchedFoods = SearchedFoods(searchedFoods: []);

  SearchedFoods get getFoods => _searchedFoods;

  var foodApiRepository = FoodApiRepository();

  Future<void> searchFood(String searchedQuery) async {
    //first, clear the previous searched list
    _searchedFoods.searchedFoods.clear();

    //then, request the new searched list content
    _searchedFoods = await foodApiRepository.searchFood(searchedQuery);

    notifyListeners();
  }
}
