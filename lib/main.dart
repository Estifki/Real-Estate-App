import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Providers/catagory_provider.dart';
import 'Providers/real_estate_provider.dart';
import './routes/routes.dart';
import 'screens/real_estate_details.dart';
import './screens/view_catagory.dart';

import 'navgation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatagoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RealEstateProvider(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Relo State',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const Navgation(),
        routes: {
          Routes.viewCatagoryScreen: (context) => const ViewCatagory(),
          Routes.detailsScreen: (context) => const DetailsScreen(),
        },
      ),
    );
  }
}
