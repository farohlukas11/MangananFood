import 'package:flutter/material.dart';
import 'package:submission_pemula/model/food_model.dart';
import 'package:submission_pemula/utils/currency_formatter.dart';

import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> listFavorite = FoodModel.listFood;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Favorite Page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: listFavorite.length,
          itemBuilder: (context, index) {
            FoodModel foodFavorite = listFavorite[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailPage(
                      foodData: foodFavorite,
                    );
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image(
                              height: 80,
                              fit: BoxFit.cover,
                              image: foodFavorite.listImageUrl![0].imageUrl !=
                                          null &&
                                      foodFavorite.listImageUrl!.isNotEmpty
                                  ? NetworkImage(
                                      foodFavorite.listImageUrl![0].imageUrl
                                          .toString(),
                                    )
                                  : const AssetImage('images/images_onboard1.png')
                                      as ImageProvider,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                foodFavorite.nameFood != null
                                    ? foodFavorite.nameFood.toString()
                                    : 'Coming Soon',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                foodFavorite.priceFood != null
                                    ? CurrencyFormat.convertToIdr(foodFavorite.priceFood)
                                    : 'Not Available',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
