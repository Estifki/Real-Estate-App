import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/Providers/real_estate_provider.dart';

import '../widget/view_catagory_items.dart';

// ignore: must_be_immutable
class ViewCatagory extends StatelessWidget {
  const ViewCatagory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedCatagory = ModalRoute.of(context)!.settings.arguments as List;
    var filteredItems = Provider.of<RealEstateProvider>(context)
        .selectedCatagory(selectedCatagory[0]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(selectedCatagory[1]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: filteredItems
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
