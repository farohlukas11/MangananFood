class UserModel {
  String? _imageUrl;
  late String _imageProfile;
  late String _nameUser;
  late String _usernameUser;
  String? _descriptionUser;

  UserModel(
      {String? imageUrl,
      required String imageProfile,
      required String nameUser,
      required String usernameUser,
      String? descriptionUser}) {
    _imageUrl = imageUrl;
    _imageProfile = imageProfile;
    _nameUser = nameUser;
    _usernameUser = usernameUser;
    _descriptionUser = descriptionUser;
  }

  String? get imageUrl => _imageUrl;

  String get imageProfile => _imageProfile;

  String get nameUser => _nameUser;

  String get usernameUser => _usernameUser;

  String? get descriptionUser => _descriptionUser;

  static UserModel user = UserModel(
    imageUrl:
        'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    imageProfile: 'images/user_photo.jpg',
    nameUser: 'Faroh Muhammad Lukas',
    usernameUser: 'farohlukas11@gmail.com',
    descriptionUser:
        'Halo nama saya Faroh Muhammad Lukas, Saya seorang mahasiswa dari Kota Madiun. Saya dari Teknik Informatika yang saat ini sedang mendalami programming khususnya Mobile App Android dan Flutter',
  );
}
