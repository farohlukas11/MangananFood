import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submission_pemula/model/food_model.dart';
import 'package:submission_pemula/utils/currency_formatter.dart';

class DetailPage extends StatelessWidget {
  final FoodModel foodData;

  const DetailPage({Key? key, required this.foodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ImageSliderDetail(foodData: foodData),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: FavoriteButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodData.nameFood != null
                      ? foodData.nameFood.toString()
                      : 'Coming Soon',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      foodData.priceFood != null
                          ? CurrencyFormat.convertToIdr(foodData.priceFood)
                          : 'Not Available',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      foodData.totalAvailable != null
                          ? 'Tersedia ${foodData.totalAvailable}'
                          : 'Kosong',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Deskripsi',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.shade700, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    foodData.descriptionFood != null
                        ? foodData.descriptionFood.toString()
                        : 'Description not available',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      foodData.ratingFood != null
                          ? 'Rating : ${foodData.ratingFood.toString()}'
                          : 'Rating : 0.0',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: AddCartButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSliderDetail extends StatelessWidget {
  final FoodModel foodData;

  const ImageSliderDetail({Key? key, required this.foodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return foodData.listImageUrl!.isNotEmpty && foodData.listImageUrl != null
        ? CarouselSlider.builder(
            itemCount: foodData.listImageUrl!.length,
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
              reverse: false,
              initialPage: 0,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              ImageFood imageFood = foodData.listImageUrl![index];

              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
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
                    image: imageFood.imageUrl != null
                        ? NetworkImage(imageFood.imageUrl.toString())
                        : const AssetImage('images/images_onboard1.png')
                            as ImageProvider,
                  ),
                ),
              );
            },
          )
        : Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                'Gambar Tidak ada',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            ),
          );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool? _isFavorite;

  bool get isFavorite => _isFavorite ?? false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
    );
  }
}

class AddCartButton extends StatefulWidget {
  const AddCartButton({Key? key}) : super(key: key);

  @override
  State<AddCartButton> createState() => _AddCartButtonState();
}

class _AddCartButtonState extends State<AddCartButton> {
  bool? _isAddCart;

  bool get isAddCart => _isAddCart ?? true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: isAddCart
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade700,
              ),
              onPressed: () {
                setState(() {
                  _isAddCart = !isAddCart;
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Masukkan ke Cart',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.teal.shade700,
                  width: 2,
                ),
              ),
              onPressed: () {
                setState(() {
                  _isAddCart = !isAddCart;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hapus dari Cart',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.teal.shade700,
                  ),
                ],
              ),
            ),
    );
  }
}
