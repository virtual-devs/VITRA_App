import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../styles/fontstyles/estilo_barra_busqueda.dart';

Center nodatatransporte() {
  return Center(
    child: SizedBox(
      width: 350,
      height: 480,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset('assets/gif/109013-oopsie.json'),
            ),
            const Text(
              '¡Opss, parece que no hay ningun transporte!',
              style: EstiloBarraBusqueda.labelbarrabusqueda,
            ),
          ],
        ),
      ),
    ),
  );
}
