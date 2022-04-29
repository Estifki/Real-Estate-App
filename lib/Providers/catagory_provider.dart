import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:real_state/models/catagory.dart';
import 'package:http/http.dart' as http;

class CatagoryProvider with ChangeNotifier {
  final List<CatagoryModel> _catagoryItems = [
    CatagoryModel(
      id: "Enyi",
      name: "Enyi Real-State",
      imgUrl: "images/img01.jpg",
    ),
    CatagoryModel(
      id: "Flint",
      name: "Flint-Stone Homes",
      imgUrl: "images/img02.jpg",
    ),CatagoryModel(
      id: "Meta",
      name: "Meta Real-State",
      imgUrl: "images/img03.jpg",
    ),
    CatagoryModel(
      id: "Noah",
      name: "Noah Real-State",
      imgUrl: "images/img04.jpg",
    ),
    CatagoryModel(
      id: "Ayat",
      name: "Ayat Real-State",
      imgUrl: "images/img05.jpg",
    ),
    CatagoryModel(
      id: "SunShine",
      name: "SunShine Real-State",
      imgUrl: "images/img06.jpg",
    ),
    
    
  ];

  List<CatagoryModel> get catagoryItems {
    return [..._catagoryItems];
  }

  
}
