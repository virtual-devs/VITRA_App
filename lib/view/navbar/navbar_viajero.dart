import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/styles/colors/colors_navbar.dart';

class NavBarViajero extends StatefulWidget {
  final Function currentIndex;
  const NavBarViajero({super.key, required this.currentIndex});

  @override
  State<NavBarViajero> createState() => _NavBarViajeroState();
}

class _NavBarViajeroState extends State<NavBarViajero> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      onTap: (int i) {
        setState(() {});
        index = i;
        widget.currentIndex(i);
      },
      selectedItemColor: ColorsNavBar.selecteditem,
      unselectedItemColor: ColorsNavBar.unselecteditem,
      backgroundColor: ColorsNavBar.background,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/navbar/icon_viaje.svg',
            height: 20,
            width: 20,
            color: (index == 0)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: "Viajes",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/navbar/icon_renta.svg',
            width: 20,
            height: 20,
            color: (index == 1)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: 'Renta',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/navbar/icon_home.svg',
            width: 15,
            height: 17,
            color: (index == 2)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/navbar/icon_historial.svg',
            width: 20,
            height: 20,
            color: (index == 3)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: 'Historial',
        ),
      ],
    );
  }
}
