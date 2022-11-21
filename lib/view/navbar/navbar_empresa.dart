import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors/colors_navbar.dart';

class NavbarEmpresa extends StatefulWidget {
  final Function currentIndex;
  const NavbarEmpresa({super.key, required this.currentIndex});

  @override
  State<NavbarEmpresa> createState() => _NavbarEmpresaState();
}

class _NavbarEmpresaState extends State<NavbarEmpresa> {
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
            'assets/icons/navbar/icon_viaje_empresa.svg',
            color: (index == 0)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: "Viajes",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/navbar/icon_renta.svg',
            width: 15,
            height: 17,
            color: (index == 1)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: 'Unidades',
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
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/navbar/icon_user.svg',
            width: 20,
            height: 20,
            color: (index == 4)
                ? ColorsNavBar.selecteditem
                : ColorsNavBar.unselecteditem,
          ),
          label: "Perfil",
        ),
      ],
    );
  }
}
