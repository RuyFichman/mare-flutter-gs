import 'package:flutter/material.dart';
import '../modelo/local_pesca.dart';
import '../ui/telas/splash_screen.dart';
import '../ui/telas/intro_screen.dart';
import '../ui/telas/inicio_screen.dart';
import '../ui/telas/diario_screen.dart';
import '../ui/telas/especies_screen.dart';
import '../ui/telas/mapa_screen.dart';
import '../ui/telas/detalhe_screen.dart';
import '../ui/telas/sobre_screen.dart';
import 'app_rotas.dart';

class AppNavegacao {
  static Route<dynamic> gerarRota(RouteSettings settings) {
    switch (settings.name) {
      case AppRotas.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRotas.intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());

      case AppRotas.inicio:
        return MaterialPageRoute(builder: (_) => const InicioScreen());

      case AppRotas.diario:
        return MaterialPageRoute(builder: (_) => const DiarioScreen());

      case AppRotas.especies:
        return MaterialPageRoute(builder: (_) => const EspeciesScreen());

      case AppRotas.mapa:
        return MaterialPageRoute(builder: (_) => const MapaScreen());

      case AppRotas.detalhe:
        final local = settings.arguments as LocalPesca;
        return MaterialPageRoute(builder: (_) => DetalheScreen(local: local));

      case AppRotas.sobre:
        return MaterialPageRoute(builder: (_) => const SobreScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Rota não encontrada'))),
        );
    }
  }
}
