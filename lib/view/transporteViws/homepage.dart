import 'package:flutter/material.dart';
import 'package:vitrapp/view-model/navbar/nvregister.dart';
import 'package:vitrapp/view-model/routes/route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  Nvregister? myNvbar;
  @override
  void initState() {
    myNvbar = Nvregister(currentIndex: (i) {
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
      body: Routes(index: index),
    );
  }
}
