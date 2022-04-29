import 'package:flutter/material.dart';
import 'package:real_state/screens/favorite.dart';
import 'package:real_state/screens/home.dart';

class Navgation extends StatefulWidget {
  const Navgation({Key? key}) : super(key: key);

  @override
  State<Navgation> createState() => _NavgationState();
}

class _NavgationState extends State<Navgation> {
  int _selectedindex = 0;

 

  @override
  Widget build(BuildContext context) {
    const List<Widget> _allpages = [
      Home(),
      FavoriteScreen(),
    ];

    void onItemtap(int index) {
      setState(() {
        _selectedindex = index;
      });
    }

    return Scaffold(
      body: _allpages.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        // selectedFontSize: 12.5,
        selectedItemColor: Colors.indigo,
        // unselectedItemColor: Colors.grey.shade700,
        backgroundColor: Colors.grey.shade200,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              size: 25,
            ),
            label: "Explore",
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.explore_outlined,
          //       size: 25,
          //     ),
          //     label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                size: 25,
              ),
              label: "Favorite"),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.person,
          //       size: 25,
          //     ),
          //     label: "Profile"),
        ],
        currentIndex: _selectedindex,
        onTap: onItemtap,
      ),
    );
  }
}
