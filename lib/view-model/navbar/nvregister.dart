import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/styles/colors/colorsapp.dart';

class Nvregister extends StatefulWidget {
  final Function currentIndex;
  const Nvregister({super.key, required this.currentIndex});

  @override
  State<Nvregister> createState() => _NvregisterState();
}

class _NvregisterState extends State<Nvregister> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      onTap: (int i) {
        setState(() {});
        index = i;
        widget.currentIndex(i);
      },
      selectedItemColor: ColorsNavigationBar.colorselecteditem,
      unselectedItemColor: ColorsNavigationBar.colorunselecteditem,
      backgroundColor: ColorsNavigationBar.colorbackground,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_travel),
          label: "Viajes",
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Principal'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.car_rental,
            ),
            label: "Renta"),
      ],
    );
  }
}
