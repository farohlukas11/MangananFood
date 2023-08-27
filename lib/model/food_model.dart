class FoodModel {
  List<ImageFood>? _listImageUrl;
  String? _nameFood;
  int? _priceFood;
  String? _descriptionFood;
  double? _ratingFood;
  int? _totalAvailable;
  int? _totalPick;

  FoodModel({
    List<ImageFood>? listImageUrl,
    String? nameFood,
    int? priceFood,
    String? descriptionFood,
    double? ratingFood,
    int? totalAvailable,
  }) {
    _listImageUrl = listImageUrl;
    _nameFood = nameFood;
    _priceFood = priceFood;
    _descriptionFood = descriptionFood;
    _ratingFood = ratingFood;
    _totalAvailable = totalAvailable;
  }

  int? get totalAvailable => _totalAvailable;

  double? get ratingFood => _ratingFood;

  String? get descriptionFood => _descriptionFood;

  int? get priceFood => _priceFood;

  String? get nameFood => _nameFood;

  List<ImageFood>? get listImageUrl => _listImageUrl;

  int get totalPick => _totalPick ?? 1;

  set totalPick(int value) {
    _totalPick = value;
  }

  static List<FoodModel> listFood = [
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://thumb.viva.co.id/media/frontend/thumbs3/2016/05/03/5727ee73cc978-7-makanan-asli-dari-indonesia-ini-jadi-favoritnya-warga-dunia_665_374.jpg'),
        ImageFood(
            imageUrl:
                'https://static.rctiplus.id/media/900/files/fta_rcti/news/2304989.jpg'),
        ImageFood(
            imageUrl:
                'https://www.masakapahariini.com/wp-content/uploads/2019/06/sate-ayam-ponorogo-780x440.jpg'),
        ImageFood(
            imageUrl:
                'https://img-global.cpcdn.com/recipes/a7d1930dca4765e0/751x532cq70/sate-ayam-madura-foto-resep-utama.jpg'),
      ],
      nameFood: 'Sate Ayam',
      priceFood: 20000,
      descriptionFood:
          'Sate Ayam dibuat dengan daging pilihan yang dibakar dengan menggunakan arang',
      ratingFood: 4.8,
      totalAvailable: 120,
    ),
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://awsimages.detik.net.id/community/media/visual/2022/06/29/gado-gado-legendaris-2.jpeg?w=1200'),
        ImageFood(
            imageUrl:
                'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2019/08/29/1093597743.jpg'),
        ImageFood(
            imageUrl:
                'https://img-global.cpcdn.com/recipes/d673616eeeb1cbf5/1200x630cq70/photo.jpg'),
        ImageFood(
            imageUrl:
                'https://img-global.cpcdn.com/recipes/df29e9f4c38facdc/1200x630cq70/photo.jpg'),
      ],
      nameFood: 'Gado Gado',
      priceFood: 10000,
      descriptionFood:
          'Gado Gado dibuat dengan sayuran, gorengan, telur dan kerupuk yang ditaburi bumbu kacang',
      ratingFood: 4.7,
      totalAvailable: 120,
    ),
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://aksaraintimes.id/wp-content/uploads/2022/02/Pecel-Madiun.jpg'),
        ImageFood(
            imageUrl:
                'https://awsimages.detik.net.id/community/media/visual/2021/05/21/cara-membuat-sambal-pecel-madiun-1.jpeg?w=700&q=90'),
        ImageFood(
            imageUrl:
                'https://i0.wp.com/img-global.cpcdn.com/recipes/51a197cb0115aa01/1360x964cq70/pecel-madiun.jpg'),
        ImageFood(
            imageUrl:
                'https://img.inews.co.id/files/inews_new/2020/11/12/pecel_madiun_campuran_bayam.jpg'),
      ],
      nameFood: 'Pecel Madiun',
      priceFood: 10000,
      descriptionFood:
          'Pecel Madiun adalah pecel khas madiun dengan rasa sambal yang enak dengan lauk tempe/rempeyek',
      ratingFood: 4.9,
      totalAvailable: 200,
    ),
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://salahterselubung.files.wordpress.com/2019/02/whatsapp-image-2019-02-26-at-9.51.09-pm.jpeg'),
        ImageFood(
            imageUrl:
                'https://img-global.cpcdn.com/recipes/9de6f5a7a44cacdd/1200x630cq70/photo.jpg'),
        ImageFood(
            imageUrl:
                'https://i0.wp.com/img-global.cpcdn.com/recipes/c8412f2ebd38d141/1360x964cq70/tepo-kecap.jpg'),
        ImageFood(
            imageUrl:
                'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/84f2e1b0-d71d-4589-b2c6-b93a2714550c_Go-Biz_20211026_151541.jpeg?h=636&w=1082&fit=crop&auto=compress'),
      ],
      nameFood: 'Tepo',
      priceFood: 5000,
      descriptionFood:
          'Tepo adalah makanan dengan bahan ketupat yang disajikan dengan sayuran/kecap dengan lauk tempe/krupuk',
      ratingFood: 4.6,
      totalAvailable: 60,
    ),
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://cdn-2.tstatic.net/makassar/foto/bank/images/Resep-Rawon-Daging-Ini-Bikin-Sahur-Jadi-Lebih-Bersemangat.jpg'),
        ImageFood(
            imageUrl:
                'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/rawon.jpg'),
        ImageFood(
            imageUrl:
                'https://selerasa.com/wp-content/uploads/2018/11/rawon-jogja-1200x720.jpg'),
        ImageFood(
            imageUrl:
                'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/05/04/2250899870.png'),
      ],
      nameFood: 'Rawon',
      priceFood: 20000,
      descriptionFood:
          'Rawon adalah makanan khas jawa timur biasanya berisi daging sapi dengan bumbu rempah alami ',
      ratingFood: 4.7,
      totalAvailable: 50,
    ),
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://assets.pikiran-rakyat.com/crop/0x508:821x1011/x/photo/2022/04/26/2747824482.jpg'),
        ImageFood(
            imageUrl:
                'https://grudo.ngawikab.id/wp-content/uploads/2021/05/soto-2.jpg'),
        ImageFood(
            imageUrl:
                'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/03/04/708251878.png'),
        ImageFood(
            imageUrl:
                'https://img.okezone.com/content/2022/05/04/298/2589270/mau-yang-segar-masak-soto-kudus-saja-yuk-dGb3ULTCkn.jpg'),
      ],
      nameFood: 'Soto',
      priceFood: 10000,
      descriptionFood:
          'Soto adalah makanan dengan lauk daging ayam, kuah soto, dan krupuk dengan menggunakan nasi',
      ratingFood: 4.9,
      totalAvailable: 190,
    ),
    FoodModel(
      listImageUrl: [
        ImageFood(
            imageUrl:
                'https://cdn0-production-images-kly.akamaized.net/fMEryffy2mhD6GQMRkwp9Xa8q4w=/1032x0:4489x3457/1200x900/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3903607/original/012933000_1642144775-shutterstock_2091544333.jpg'),
        ImageFood(
            imageUrl:
                'https://www.resepistimewa.com/wp-content/uploads/resep-wingko-babat.jpg'),
        ImageFood(
            imageUrl:
                'https://blog.tokowahab.com/wp-content/uploads/2019/12/Resep-Wingko-Babat-yang-Enak.jpg'),
        ImageFood(
            imageUrl: 'https://i.ytimg.com/vi/j6ujXGqaPps/maxresdefault.jpg'),
      ],
      nameFood: 'Wingko Babat',
      priceFood: 13000,
      descriptionFood:
          'Wingko Babat adalah makanan yang dibuat dari bahan seperti kelapa muda, tepung beras ketan, dan gula',
      ratingFood: 4.5,
      totalAvailable: 210,
    ),
    FoodModel(
        listImageUrl: [
          ImageFood(
              imageUrl:
                  'https://correcto.id/content/images/th1_2020071305321357034.jpg'),
          ImageFood(
              imageUrl:
                  'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/08/16/3585052692.jpeg'),
          ImageFood(
              imageUrl:
                  'https://images.genpi.co/resize/1280x860-100/uploads/jateng/arsip/watermark/2022/04/15/es-buto-ijo-kartasura-foto-genpicodesty-luthfiani-miok.webp'),
          ImageFood(
              imageUrl:
                  'https://jurnalisindonesia.id/uploads/large/7c77547018088edb360d08cce9510e67.jpg'),
        ],
        nameFood: 'Es Buto Ijo',
        priceFood: 7000,
        descriptionFood:
            'Es Buto Ijo adalah minuman yang berbahan dasar kelapa muda, nata de coco, kolang kaling serta sagu mutiara.',
        ratingFood: 4.7,
        totalAvailable: 300),
    FoodModel(
        listImageUrl: [
          ImageFood(
              imageUrl:
                  'https://awsimages.detik.net.id/community/media/visual/2020/05/14/0af32d8b-36b7-4555-8e79-4fd54c98f795.jpeg?w=700&q=90'),
          ImageFood(
              imageUrl:
                  'https://akcdn.detik.net.id/community/media/visual/2021/04/13/900209858_43.jpeg?w=250&q='),
          ImageFood(
              imageUrl:
                  'https://bisnismuda.id/assets/content/20201130123848000000IllustrationWebBisnisMuda20201130T123136001.jpg'),
          ImageFood(
              imageUrl:
                  'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/10/09/922223947.jpg'),
        ],
        nameFood: 'Es Teh',
        priceFood: 5000,
        descriptionFood:
            'Es Teh adalah minuman yang dibuat dengan gula dan menggunakan daun teh alami yang telah diolah',
        ratingFood: 4.6,
        totalAvailable: 400),
    FoodModel(
        listImageUrl: [
          ImageFood(
              imageUrl:
                  'https://img-global.cpcdn.com/recipes/cd3e133a9306252e/1200x630cq70/photo.jpg'),
          ImageFood(
              imageUrl:
                  'https://img-global.cpcdn.com/recipes/b9d5820b9c42e230/680x482cq70/wedang-cemue-cemoe-foto-resep-utama.jpg'),
          ImageFood(
              imageUrl:
                  'https://img-global.cpcdn.com/recipes/eb9af2b6ed0b9307/1200x630cq70/photo.jpg'),
          ImageFood(
              imageUrl:
                  'https://i0.wp.com/i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/839828bd-a393-41d3-b7b7-974478c76a95_IMG_20200812_231511_122.jpg'),
        ],
        nameFood: 'Cemue',
        priceFood: 10000,
        descriptionFood:
            'Cemue adalah minuman yang dibuat dengan perpaduan santan, pandan dan jahe, dengan toping roti dan kacang yang cocok diminum hangat',
        ratingFood: 4.8,
        totalAvailable: 150),
    FoodModel(
        listImageUrl: [
          ImageFood(
              imageUrl:
                  'https://img-global.cpcdn.com/recipes/c0da170a95e73250/751x532cq70/wedang-ronde-foto-resep-utama.jpg'),
          ImageFood(
              imageUrl:
                  'https://cdn1-production-images-kly.akamaized.net/i_F3eCcVDeayB76d7TB9XOelGUk=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2834701/original/013278100_1561180469-iStock-663898564.jpg'),
          ImageFood(
              imageUrl:
                  'https://www.piknikdong.com/wp-content/uploads/2021/06/Resep-Wedang-Ronde-Sederhana-min.jpg'),
          ImageFood(
              imageUrl:
                  'https://topwisata.info/wp-content/uploads/2021/02/Wedang2BRonde2B252812529.jpg'),
        ],
        nameFood: 'Wedang Ronde',
        priceFood: 10000,
        descriptionFood:
            'Wedang Ronde adalah minuman yang dibuat dari beras ketan dan air, dibentuk bulat yang disajikan dalam kuah jahe hangat dan gula.',
        ratingFood: 4.6,
        totalAvailable: 200),
  ];
}

class ImageFood {
  String? _imageUrl;

  ImageFood({int? id, String? imageUrl}) {
    _imageUrl = imageUrl;
  }

  String? get imageUrl => _imageUrl;
}
