import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:light_carousel/light_carousel.dart';

import '../Providers/real_estate_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    var selectedItemId = ModalRoute.of(context)!.settings.arguments as String;
    var selectedItem =
        Provider.of<RealEstateProvider>(context).selectedItem(selectedItemId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(selectedItem.name),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedItem.pressedFavorite();
                });
                if (selectedItem.isFavorite) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Product Added to Favorite!",
                        style: TextStyle(fontSize: 16),
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Product Removed from Favorite!",
                        style: TextStyle(fontSize: 16),
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: selectedItem.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.orange,
                    ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: _screenSize.height * 0.4,
            width: double.infinity,
            child: LightCarousel(
              radius: const Radius.circular(0),
              images: [
                ExactAssetImage(selectedItem.imgUrl),
                ExactAssetImage(selectedItem.imgUrl1),
                ExactAssetImage(selectedItem.imgUrl2),
              ],
              animationDuration: const Duration(
                milliseconds: 800,
              ),
              dotSize: 5.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 10.0,
              borderRadius: true,
              noRadiusForIndicator: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: _screenSize.height * 0.03,
                right: _screenSize.width * 0.02,
                left: _screenSize.width * 0.02),
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        selectedItem.name,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "ETB ${selectedItem.price.toString()} Million",
                        style: const TextStyle(
                          fontSize: 16.5,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  const Text(
                    "Property features",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ExpandableNotifier(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expandable(
                          collapsed: ExpandableButton(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const Text(
                                    "If you have been looking for a large family home on acreage within 5 minutes to the CBD then this property is a must see.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(""),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 8,
                                          top: 8.0,
                                        ),
                                        child: Text(
                                          "see more",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          expanded: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedItem.specfication.elementAt(0),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  selectedItem.specfication.elementAt(1),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  selectedItem.specfication.elementAt(2),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  selectedItem.specfication.elementAt(3),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        margin: const EdgeInsets.all(0.0),
        color: Colors.blue,
        child: SizedBox(
          height: _screenSize.height * 0.09,
          width: double.infinity,
          child: Center(
              child: Container(
            height: _screenSize.height * 0.064,
            width: _screenSize.width * 0.3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 2.5, color: Colors.white)),
            child: const Text(
              "Call Now",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
