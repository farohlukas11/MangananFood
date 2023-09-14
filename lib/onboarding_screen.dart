import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:submission_pemula/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool? _isLastPage;

  bool get isLastPage => _isLastPage ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 80),
            height: 750,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  _isLastPage = index == 2;
                });
              },
              children: const [
                BuildOnBoardingScreen(
                  color: Colors.white,
                  urlImage: 'images/Logo.png',
                  title: 'Temukan Berbagai Makanan Pilihan',
                  subTitle:
                      'Disini terdapat berbagai makanan/minuman dengan kemudahan pemesanan',
                ),
                BuildOnBoardingScreen(
                  color: Colors.white,
                  urlImage: 'images/images_onboard2.png',
                  title: 'Beragam banyak Pilihan',
                  subTitle:
                      'Disini anda dapat memilih makanan/munuman yang sesuai selera dan pas dikantong anda',
                ),
                BuildOnBoardingScreen(
                  color: Colors.white,
                  urlImage: 'images/images_onboard1.png',
                  title: 'Mudah dalam Pemesanan',
                  subTitle:
                      'Disini anda dengan mudah melakukan checkout dalam memesan makanan/minuman secara cepat',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: Colors.teal.shade700),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.teal.shade700,
                    ),
                    onDotClicked: (index) {
                      controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(color: Colors.teal.shade700),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BuildOnBoardingScreen extends StatelessWidget {
  final Color color;
  final String urlImage;
  final String title;
  final String subTitle;

  const BuildOnBoardingScreen(
      {Key? key,
      required this.color,
      required this.urlImage,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  urlImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 280,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
