import 'package:flutter/material.dart';
import 'package:real_state/routes/routes.dart';

import '../models/real_estate.dart';

// ignore: must_be_immutable
class ViewCatagoryItem extends StatelessWidget {
  String id;
  String name;
  String imgUrl;
  String imgUrl1;
  String imgUrl2;
  double price;
  String location;

  RealEstatetype realEstatetype;
  List<String> specfication;

  ViewCatagoryItem({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.imgUrl1,
    required this.imgUrl2,
    required this.specfication,
    required this.location,
    required this.realEstatetype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.detailsScreen, arguments: id);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
        child: Stack(children: [
          Card(
            margin: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            elevation: 4.0,
            child: Container(
              height: _screenSize.height * 0.25,
              width: _screenSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: _screenSize.height * 0.25,
                    width: _screenSize.width * 0.55,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(imgUrl),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: _screenSize.height * 0.015),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              specfication.elementAt(0),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              specfication.elementAt(1),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              specfication.elementAt(2),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: _screenSize.height * 0.07,
              width: _screenSize.width * 0.55,
              decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: _screenSize.width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ETB ${price.toString()} Million",
                      style: const TextStyle(
                        fontSize: 16.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 15,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
