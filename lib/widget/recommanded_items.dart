import 'package:flutter/material.dart';
import 'package:real_state/models/real_estate.dart';

import '../routes/routes.dart';

// ignore: must_be_immutable
class RecommandedItems extends StatelessWidget {
  String id;
  String name;
  String imgUrl;
  String location;
  String price;
  RealEstatetype realEstatetype;

  RecommandedItems({
    Key? key,
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.location,
    required this.price,
    required this.realEstatetype,
  }) : super(key: key);

  String get _realEstateType {
    if (realEstatetype == RealEstatetype.forSale) {
      return "for Sale";
    } else if (realEstatetype == RealEstatetype.forRent) {
      return "for Rent";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsScreen, arguments: id);
      },
      child: Stack(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8, top: 16, bottom: 16),
          child: Card(
            elevation: 5.0,
            margin: const EdgeInsets.all(0),
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              height: _screenSize.height * 0.35,
              width: _screenSize.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: _screenSize.height * 0.25,
                      width: _screenSize.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        image: DecorationImage(
                          image: AssetImage(imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.indigo,
                            size: 16,
                          ),
                          Text(
                            " $location",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          top: _screenSize.height * 0.005,
          right: _screenSize.width * 0.05,
          child: Container(
            height: _screenSize.height * 0.04,
            width: _screenSize.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _realEstateType,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: _screenSize.height * 0.03,
          right: _screenSize.width * 0.05,
          child: Column(children: [
            Text(
              '$price ETB',
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const Text(
              " /Per month ",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
