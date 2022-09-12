import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kingyonas/Logic/CartCubit/cart_cubit.dart';
import 'package:kingyonas/Presentation/screens/Cart/cart.dart';

import 'package:kingyonas/Presentation/screens/Home/home.dart';
import 'package:kingyonas/Presentation/screens/Shop/shop.dart';
import 'package:kingyonas/Presentation/screens/TheArthist/the_arthis.dart';
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
      backgroundColor: const Color.fromARGB(255, 243, 237, 237),
      body: getPage(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                color: _currentIndex != 0 ? kSecondaryWhite : kprimary,
              ),
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                color: kprimary,
              ),
            ),
            selectedColor: kprimary,
          ),

          /// Home
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              child: SvgPicture.asset(
                'assets/icons/gallary.svg',
                color: _currentIndex != 1 ? kSecondaryWhite : kprimary,
              ),
            ),
            title: const Text(
              "Gallary",
              style: TextStyle(
                color: kprimary,
              ),
            ),
            selectedColor: kprimary,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: SizedBox(
                width: 30,
                height: 20,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/cart.svg',
                      color: _currentIndex != 2 ? kSecondaryWhite : kprimary,
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return state.itemCart.isNotEmpty
                            ? Positioned(
                                right: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 196, 0, 0),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                    child:
                                        Text(state.itemCart.length.toString(),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: kwhite,
                                            )),
                                  ),
                                ),
                              )
                            : const Text("");
                      },
                    ),
                  ],
                )),
            title: const Text(
              "cart",
              style: TextStyle(color: kprimary),
            ),
            selectedColor: kprimary,
          ),

          /// Profile
          SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Arthist"),
              selectedColor: kprimary),
        ],
      ),
    );
  }

  Widget getPage() {
    switch (_currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Shop();
      case 2:
        return const CartPage();

      default:
        return const TheArthist();
    }
  }
}
