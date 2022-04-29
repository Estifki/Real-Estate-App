import 'package:flutter/cupertino.dart';

class RealEstateModel with ChangeNotifier {
  String id;
  String name;
  String inCatagory;
  String imgUrl;
  String imgUrl1;
  String imgUrl2;
  double price;
  String location;
  bool isRecommanded;
  bool isFavorite;
  RealEstatetype realEstatetype;
  List<String> specfication;

  RealEstateModel({
    required this.id,
    required this.name,
    required this.inCatagory,
    required this.price,
    required this.location,
    required this.isRecommanded,
    required this.imgUrl,
    required this.imgUrl1,
    required this.imgUrl2,
    required this.specfication,
    required this.realEstatetype,
    this.isFavorite = false,
  });

  void pressedFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

enum RealEstatetype {
  forRent,
  forSale,
}
