import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submission_pemula/utils/currency_formatter.dart';

import '../model/food_model.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listFood = FoodModel.listFood;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: ImageSliderBanner(listFood: listFood),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Makanan Terpopuler',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listFood.length,
                itemBuilder: (context, index) {
                  FoodModel foodFavorite = listFood[index];
                  return listViewCard(
                    context: context,
                    foodFavorite: foodFavorite,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewCard({
    required BuildContext context,
    required FoodModel foodFavorite,
  }) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      height: 80,
                      fit: BoxFit.cover,
                      image: foodFavorite.listImageUrl![0].imageUrl != null &&
                              foodFavorite.listImageUrl!.isNotEmpty
                          ? NetworkImage(
                              foodFavorite.listImageUrl![0].imageUrl.toString(),
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
                            ? CurrencyFormat.convertToIdr(
                                foodFavorite.priceFood)
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
  }
}

class ImageSliderBanner extends StatelessWidget {
  final List<FoodModel> listFood;

  const ImageSliderBanner({Key? key, required this.listFood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: listFood.length,
      itemBuilder: (BuildContext context, int index, int indexPage) {
        FoodModel food = listFood[index];

        return Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: food.listImageUrl![0].imageUrl != null &&
                    food.listImageUrl!.isNotEmpty
                ? DecorationImage(
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print(exception);
                      const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
                      );
                    },
                    image: NetworkImage(
                      food.listImageUrl![0].imageUrl.toString(),
                    ),
                  )
                : const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/images_onboard1.png'),
                  ),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.80,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.nameFood != null
                              ? food.nameFood.toString()
                              : 'Coming Soon',
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text(
                          food.priceFood != null
                              ? CurrencyFormat.convertToIdr(food.priceFood)
                              : 'Not Available',
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            food.ratingFood != null
                                ? 'Rating : ${food.ratingFood.toString()}'
                                : 'Rating : 0.0',
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
