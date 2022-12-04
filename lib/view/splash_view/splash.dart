import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/fontstyles/estilo_titulo_vitra.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCard.backgroundcontainerlist,
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 300,
            height: 290,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'VI',
                        style: EstiloTituloVitra.vi,
                      ),
                      Text('T', style: EstiloTituloVitra.t),
                      Text('RA', style: EstiloTituloVitra.vi),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    '\t\t\tViajes y transporte',
                    style: EstiloTituloVitra.subtituloSplash,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  width: 300,
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Lottie.asset(
                        'assets/gif/46541-nature-visite-travel.json',
                        width: double.infinity,
                        height: 190,
                        fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
