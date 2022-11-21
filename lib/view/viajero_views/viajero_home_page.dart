import 'package:flutter/material.dart';
import 'package:vitrapp/routes/route_viajero.dart';
import 'package:vitrapp/view/navbar/navbar_viajero.dart';

class ViajeroHomePage extends StatefulWidget {
  const ViajeroHomePage({super.key});

  @override
  State<ViajeroHomePage> createState() => _ViajeroHomePageState();
}

class _ViajeroHomePageState extends State<ViajeroHomePage> {
  int index = 2;
  NavBarViajero? myNvbar;
  @override
  void initState() {
    myNvbar = NavBarViajero(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNvbar,
      body: RouteViajero(index: index),
    );
  }
}
