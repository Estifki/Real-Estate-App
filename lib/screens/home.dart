import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/real_estate_provider.dart';
import '../Providers/catagory_provider.dart';
import '../widget/catagory_item.dart';
import '../widget/recommanded_items.dart';
import '../widget/userinfo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool _isLoading = true;
  // bool _isinit = true;

  @override
  // void didChangeDependencies() {
  //   if (_isinit) {
  //     Provider.of<CatagoryProvider>(context).getCatagory().then((value) {
  //       _isLoading = false;
  //     });
  //     setState(() {
  //       _isinit = false;
  //     });
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    Size _screensize = MediaQuery.of(context).size;
    var catagoryData = Provider.of<CatagoryProvider>(context);
    var isRecommanded = Provider.of<RealEstateProvider>(context).isRecommanded;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const HomeUserInfo(
            userName: "EstifKi",
            userImage: "images/one.png",
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 24.0, left: 8),
          //   child: Text(
          //     "Catagories",
          //     style: TextStyle(
          //       fontSize: 21,
          //       color: Colors.indigo,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: _screensize.height * 0.015,
          ),
          // SizedBox(
          //   height: _screensize.height * 0.11,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: catagoryTypeData.length,
          //     itemBuilder: (context, index) {
          //       return CatagoryTypeItems(
          //         id: catagoryTypeData[index].id,
          //         catagoryTypeName: catagoryTypeData[index].name,
          //         catagoryTypeImg: catagoryTypeData[index].imgUrl,
          //       );
          //     },
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 8),
            child: Text(
              "Real estate",
              style: TextStyle(
                fontSize: 21,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: _screensize.height * 0.015,
          ),
          SizedBox(
            height: _screensize.height * 0.2,
            child:
            // child: _isLoading
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
                 ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: catagoryData.catagoryItems.length,
                    itemBuilder: (context, index) {
                      return CatagoryItems(
                        id: catagoryData.catagoryItems[index].id,
                        name: catagoryData.catagoryItems[index].name,
                        imgUrl: catagoryData.catagoryItems[index].imgUrl,
                      );
                    },
                  ),
          ),
          SizedBox(
            height: _screensize.height * 0.015,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Recommanded",
              style: TextStyle(
                fontSize: 21,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            itemCount: isRecommanded.length,
            itemBuilder: (context, index) {
              return RecommandedItems(
                id: isRecommanded[index].id,
                name: isRecommanded[index].name,
                imgUrl: isRecommanded[index].imgUrl,
                price: isRecommanded[index].price.toString(),
                location: isRecommanded[index].location,
                realEstatetype: isRecommanded[index].realEstatetype,
              );
            },
          )
        ],
      ),
    );
  }
}
