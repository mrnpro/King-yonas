import 'package:flutter/material.dart';
import 'package:kingyonas/Presentation/Cart/cart.dart';
import 'package:kingyonas/Presentation/screens/Home/home.dart';
import 'package:kingyonas/Presentation/screens/Shop/shop.dart';
import 'package:kingyonas/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getPage(),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SalomonBottomBar(
          selectedItemColor: kprimary,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.home_filled),
              title: Text("Home"),

              /// selectedColor: Colors.pink,
            ),

            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.check_box),
              title: const Text(
                "Shop",
                style: TextStyle(color: kwhite),
              ),
              //selectedColor: Colors.purple,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.badge),
              title: Text("cart"),
              //selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Arthist"),
              // selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    switch (_currentIndex) {
      case 0:
        return Home();
      case 1:
        return Shop();
      case 2:
        return CartPage();

      default:
        return Text("page not placed");
    }
  }
}
