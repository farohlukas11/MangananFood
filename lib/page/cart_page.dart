import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:submission_pemula/home_screen.dart';
import 'package:submission_pemula/model/food_model.dart';
import 'package:submission_pemula/utils/currency_formatter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<FoodModel> listFavorite = FoodModel.listFood;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Cart Page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MediaQuery.removePadding(
              removeBottom: true,
              removeTop: true,
              context: context,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listFavorite.length,
                itemBuilder: (context, index) {
                  FoodModel foodFavorite = listFavorite[index];

                  return Card(
                    margin: const EdgeInsets.all(7),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image(
                                    height: 80,
                                    fit: BoxFit.cover,
                                    image: foodFavorite.listImageUrl![0]
                                                    .imageUrl !=
                                                null &&
                                            foodFavorite
                                                .listImageUrl!.isNotEmpty
                                        ? NetworkImage(
                                            foodFavorite
                                                .listImageUrl![0].imageUrl
                                                .toString(),
                                          )
                                        : const AssetImage(
                                                'images/images_onboard1.png')
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        foodFavorite.nameFood != null
                                            ? foodFavorite.nameFood.toString()
                                            : 'Coming Soon',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Total Harga : ${CurrencyFormat.convertToIdr(foodFavorite.priceFood!.toInt() * foodFavorite.totalPick)}',
                                  style: const TextStyle(
                                    fontSize: 19,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(55, 30),
                                        backgroundColor: Colors.teal.shade700,
                                        maximumSize: const Size(55, 30)),
                                    onPressed: () {
                                      setState(() {
                                        if (foodFavorite.totalPick <= 1) {
                                          return;
                                        } else {
                                          foodFavorite.totalPick =
                                              foodFavorite.totalPick - 1;
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    foodFavorite.totalPick.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(55, 30),
                                      backgroundColor: Colors.teal.shade700,
                                      maximumSize: const Size(55, 30),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (foodFavorite.totalPick >=
                                            foodFavorite.totalAvailable!
                                                .toInt()) {
                                          return;
                                        } else {
                                          foodFavorite.totalPick =
                                              foodFavorite.totalPick + 1;
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(
                            'Total Keseluruhan Harga : ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            CurrencyFormat.convertToIdr(
                                getAllPriceFood(list: listFavorite)),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: getAllPriceFood(list: listFavorite) != 0
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade700,
                              ),
                              onPressed: () {
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  desc:
                                      'Berhasil melakukan Checkout, Silahkan Tunggu pesanan Dikirim!',
                                  buttons: [
                                    DialogButton(
                                      color: Colors.teal.shade700,
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const HomeScreen();
                                            },
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: const Text(
                                        'Home',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).show();
                              },
                              child: const Text(
                                'Checkout Sekarang',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : TextButton(
                              onPressed: () {},
                              child: Text(
                                'Tidak Dapat melakukan Checkout',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal.shade700,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  int getAllPriceFood({List<FoodModel>? list}) {
    List<int> sum = [];
    if (list!.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        sum.add(list[i].priceFood != null
            ? list[i].priceFood! * list[i].totalPick
            : 0);
      }
      return sum.fold(0, (int a, item) => a + item);
    } else {
      return 0;
    }
  }
}
