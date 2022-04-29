import 'package:flutter/cupertino.dart';
import '../models/real_estate.dart';

class RealEstateProvider with ChangeNotifier {
  final List<RealEstateModel> _viewRealEstateItems = [
    RealEstateModel(
      id: "r1",
      name: "Double Bed-Room",
      inCatagory: "Enyi",
      isRecommanded: true,
      imgUrl: "images/img01.jpg",
      imgUrl1: "images/img11.jpg",
      imgUrl2: "images/img10.jpg",
      specfication: [
        "- 251.2 sqft",
        "- 3 bed-rooms",
        "- 1 bath-room",
        """
- 2 Living areas plus rumpus room
- A sizeable kitchen with large WIP
- Wood heating and Gas heating
- Huge allotment of approx. 7960m2 with subdivision potential
- Oversized DLUG plus extra garden shed
- Beautiful established gardens throughout
- Views from the decked balcony
- Under house storage
- Close to schools and easy access to the Western Freeway
- Short drive to the train station and CBD
"""
      ],
      location: "Megenagna infornt of Bcs",
      realEstatetype: RealEstatetype.forSale,
      price: 2.5,
    ),
    RealEstateModel(
      id: "r2",
      name: "Single Bed-Room",
      isRecommanded: true,
      specfication: [
        "- 251.2 sqft",
        "- 3 bed-rooms",
        "- 1 bath-room",
        """
- 2 Living areas plus rumpus room
- A sizeable kitchen with large WIP
- Wood heating and Gas heating
- Huge allotment of approx. 7960m2 with subdivision potential
- Oversized DLUG plus extra garden shed
- Beautiful established gardens throughout
- Views from the decked balcony
- Under house storage
- Close to schools and easy access to the Western Freeway
- Short drive to the train station and CBD
"""
      ],
      location: "Bole Bcs",
      imgUrl: "images/img05.jpg",
      imgUrl1: "images/img03.jpg",
      imgUrl2: "images/img04.jpg",
      realEstatetype: RealEstatetype.forRent,
      inCatagory: "Enyi",
      price: 1.5,
    ),
    RealEstateModel(
      id: "r3",
      name: "Master Class",
      isRecommanded: false,
      specfication: [
        "- 251.2 sqft",
        "- 3 bed-rooms",
        "- 1 bath-room",
        """
- 2 Living areas plus rumpus room
- A sizeable kitchen with large WIP
- Wood heating and Gas heating
- Huge allotment of approx. 7960m2 with subdivision potential
- Oversized DLUG plus extra garden shed
- Beautiful established gardens throughout
- Views from the decked balcony
- Under house storage
- Close to schools and easy access to the Western Freeway
- Short drive to the train station and CBD
"""
      ],
      location: "Kasanches",
      imgUrl: "images/img03.jpg",
      imgUrl1: "images/img11.jpg",
      imgUrl2: "images/img10.jpg",
      realEstatetype: RealEstatetype.forSale,
      inCatagory: "Meta",
      price: 2.75,
    ),
    RealEstateModel(
      id: "r4",
      name: "Baced room",
      isRecommanded: true,
      specfication: [
        "- 251.2 sqft",
        "- 3 bed-rooms",
        "- 1 bath-room",
        """
- 2 Living areas plus rumpus room
- A sizeable kitchen with large WIP
- Wood heating and Gas heating
- Huge allotment of approx. 7960m2 with subdivision potential
- Oversized DLUG plus extra garden shed
- Beautiful established gardens throughout
- Views from the decked balcony
- Under house storage
- Close to schools and easy access to the Western Freeway
- Short drive to the train station and CBD
"""
      ],
      location: "4-killo ",
      imgUrl: "images/img04.jpg",
      imgUrl1: "images/img11.jpg",
      imgUrl2: "images/img10.jpg",
      realEstatetype: RealEstatetype.forRent,
      inCatagory: "Noah",
      price: 2.500000,
    ),
    RealEstateModel(
      id: "r5",
      name: "King And Queen",
      location: "Addisu Gebiya",
      isRecommanded: false,
      specfication: [
        "- 251.2 sqft",
        "- 3 bed-rooms",
        "- 1 bath-room",
        """
- 2 Living areas plus rumpus room
- A sizeable kitchen with large WIP
- Wood heating and Gas heating
- Huge allotment of approx. 7960m2 with subdivision potential
- Oversized DLUG plus extra garden shed
- Beautiful established gardens throughout
- Views from the decked balcony
- Under house storage
- Close to schools and easy access to the Western Freeway
- Short drive to the train station and CBD
"""
      ],
      imgUrl: "images/img05.jpg",
      imgUrl1: "images/img11.jpg",
      imgUrl2: "images/img10.jpg",
      realEstatetype: RealEstatetype.forSale,
      inCatagory: "Enyi",
      price: 2.32,
    ),
  ];

  List<RealEstateModel> get viewCatagoryItem {
    return [..._viewRealEstateItems];
  }

  List<RealEstateModel> get isRecommanded {
    return _viewRealEstateItems.where((allItems) {
      return allItems.isRecommanded == true;
    }).toList();
  }

  List<RealEstateModel> get isFavorite {
    return _viewRealEstateItems.where((allItems) {
      return allItems.isFavorite == true;
    }).toList();
  }

  List<RealEstateModel> selectedCatagory(String selectedCatagoryId) {
    return _viewRealEstateItems.where((allItems) {
      return allItems.inCatagory.contains(selectedCatagoryId);
    }).toList();
  }

  RealEstateModel selectedItem(String selectedItemId) {
    return _viewRealEstateItems.firstWhere((selecteditem) {
      return selecteditem.id == selectedItemId;
    });
  }
}
