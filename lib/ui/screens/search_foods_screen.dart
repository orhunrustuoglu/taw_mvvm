import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_mvvm/ui/components/food_card.dart';
import 'package:taw_mvvm/ui/providers/food_api_provider.dart';

class SearchFoodsScreen extends StatefulWidget {
  const SearchFoodsScreen({super.key});
  static const routeName = "search-foods-screen";

  @override
  State<SearchFoodsScreen> createState() => _SearchFoodsScreenState();
}

class _SearchFoodsScreenState extends State<SearchFoodsScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var tController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Foods"),
      ),
      body: Center(
        child: Column(children: [
          TextField(
            controller: tController,
          ),
          isLoading
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator.adaptive(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    //display a loading indicator
                    setState(() {
                      isLoading = true;
                    });

                    //fetch data
                    await Provider.of<FoodApiProvider>(context, listen: false)
                        .searchFood(tController.text);

                    //display the fetched data
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text(
                    "Search Foods",
                    textAlign: TextAlign.center,
                  )),
          Expanded(child: Consumer<FoodApiProvider>(
            builder: (context, foodApiProvider, _) {
              if (foodApiProvider.getFoods.searchedFoods.isEmpty) {
                return const Center(child: Text("Empty search list!"));
              }
              return ListView(
                children: foodApiProvider.getFoods.searchedFoods
                    .map((f) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: FoodCard(f: f),
                        ))
                    .toList(),
              );
            },
          ))
        ]),
      ),
    );
  }
}
