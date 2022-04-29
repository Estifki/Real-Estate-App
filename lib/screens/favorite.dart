import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/Providers/real_estate_provider.dart';

import '../widget/view_catagory_items.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedFavourite = Provider.of<RealEstateProvider>(context).isFavorite;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Favorite"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: selectedFavourite
              .map<Widget>(
                (items) => ViewCatagoryItem(
                  id: items.id,
                  name: items.name,
                  imgUrl: items.imgUrl,
                  imgUrl1: items.imgUrl1,
                  imgUrl2: items.imgUrl2,
                  price: items.price,
                  realEstatetype: items.realEstatetype,
                  specfication: items.specfication,
                  location: items.location,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
