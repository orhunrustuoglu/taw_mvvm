import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taw_mvvm/data/entities/searched_foods.dart';

class FoodApiRepository {
  //
  Future<SearchedFoods> searchFood(String searchedQuery) async {
    //define the end point
    Uri uri = Uri.parse(
        "https://api.calorieninjas.com/v1/nutrition?query=$searchedQuery");

    //fetch the data
    var response = await http.get(
      uri,
      headers: {"X-Api-Key": "IUHRgWlceR6YLouw8F/yHg==jt26yq1MofEtL5ng"},
    );

    //if the fetching was successful:
    if (response.statusCode == 200) {
      return SearchedFoods.fromJson(json.decode(response.body));
    }
    //NOTE:
    //no else keyword used, because the if the operation is successful,
    //the function only reads the first return and stops running.

    //if the fetching was unsuccessful:

    print("Something went wrong!");
    return SearchedFoods(searchedFoods: []);
  }
}
