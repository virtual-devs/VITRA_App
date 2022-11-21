import 'package:flutter/material.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:vitrapp/view/empresa_views/emp_home_page.dart';

void main() async {
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
        home: EmpresaHomePage(),
      ),
    );
  }
}
