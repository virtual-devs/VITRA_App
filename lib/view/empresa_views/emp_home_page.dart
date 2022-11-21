import 'package:flutter/material.dart';
import 'package:vitrapp/view/navbar/navbar_empresa.dart';
import 'package:vitrapp/routes/route._empresa.dart';

class EmpresaHomePage extends StatefulWidget {
  const EmpresaHomePage({super.key});

  @override
  State<EmpresaHomePage> createState() => _EmpresaHomePageState();
}

class _EmpresaHomePageState extends State<EmpresaHomePage> {
  int index =2;
  NavbarEmpresa? myNvbar;
  @override
  void initState() {
    myNvbar = NavbarEmpresa(currentIndex: (i) {
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
      body: RouteEmpresa(index: index),
    );
  }
}
