import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:vitrapp/view/splash_view/splash_init.dart';

//import 'package:vitrapp/view/empresa_views/emp_home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('storage');
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ViajeroViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplasInit(),
      ),
    );
  }
}
