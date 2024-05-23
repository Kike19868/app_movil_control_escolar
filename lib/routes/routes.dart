import 'package:flutter/material.dart';
import 'package:mesadeservicio/models/tema.dart';
import 'package:mesadeservicio/models/api_data.dart';
import 'package:mesadeservicio/pages/aspirantesPages/asp_gral_page.dart';
import 'package:mesadeservicio/pages/consultaTicketsPages/consultares_page.dart';
import 'package:mesadeservicio/pages/egresadosPages/egr_ases_page.dart';
import 'package:mesadeservicio/pages/egresadosPages/egr_corr_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_bTemp_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_beca_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_certPar_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_const_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_felic_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_gral2_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_gral_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_histac_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_imss_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_modsim_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_probaul_page.dart';
import 'package:mesadeservicio/pages/estudiantesPages/est_reinbt_page.dart';
import 'package:mesadeservicio/pages/home_page.dart';
import 'package:mesadeservicio/pages/respuesta_page.dart';
import 'package:mesadeservicio/pages/splash_screen/splash_screen.dart';
import 'package:mesadeservicio/routes/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
        switch (settings.name) {
            case RouteName.splash:
         return MaterialPageRoute(builder: (_) => const Splash());
          case RouteName.homePage:
            return MaterialPageRoute(builder: (context) { return const HomePage(); },);
          case RouteName.aspGralPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return AspGralPage(tema: args); },);
          case RouteName.egrAsesPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EgrAsesPage(tema: args); },);
          case RouteName.egrCorrPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EgrCorrPage(tema: args); },);
          case RouteName.estBecaPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstBecaPage(tema: args); },);
          case RouteName.estBTempPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstBTempPage(tema: args); },);
          case RouteName.estCertParPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstCertParPage(tema: args); },);
          case RouteName.estConstPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstConstPage(tema: args); },);
          case RouteName.estFelicPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstFelicPage(tema: args); },);
          case RouteName.estGralPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstGralPage(tema: args); },);
          case RouteName.estGral2Page:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstGral2Page(tema: args); },);
          case RouteName.estHistAcPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstHistAcPage(tema: args); },);
          case RouteName.estImssPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstImssPage(tema: args); },);
          case RouteName.estModSimPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstModSimPage(tema: args); },);
          case RouteName.estProbAulPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstProbAulPage(tema: args); },);
          case RouteName.estReinBTPage:
            final args = settings.arguments as Tema;
            return MaterialPageRoute(builder: (context) { return EstReinBTPage(tema: args); },);
          case RouteName.respuestaPage:
            final args = settings.arguments as ApiData;
            return MaterialPageRoute(builder: (context) { return RespuestaPage(ticket: args); },);
          case RouteName.consultaResPage:
            final args = settings.arguments as ApiData;
            return MaterialPageRoute(builder: (context) { return ConsultaResPage(consultaEst: args); },);
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
