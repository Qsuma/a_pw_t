import 'package:app_tesis_yaliana/providers/bloc/loguinBloc/provider.dart';
import 'package:app_tesis_yaliana/providers/comision_provider.dart';
import 'package:app_tesis_yaliana/providers/event_provider.dart';
import 'package:app_tesis_yaliana/providers/student_provider.dart';
import 'package:app_tesis_yaliana/providers/work_provider.dart';
import 'package:app_tesis_yaliana/screens/register_screen.dart';

import 'package:app_tesis_yaliana/ui/theme.dart';
import 'package:flutter/material.dart';
import 'utils/preferencias_usuario.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasDeUsuario();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoguinProviderBloc(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => EstudianteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ComisionProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => EventProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => WorkProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App Eventos',
            theme: theme,
            //home: EventSelectorScreen(),
  //           home: ProfesorChangeWorkState(trabajos: [
  //   Trabajo(
  //     idtrabajo: 1,
  //     titulo: 'Trabajo de Investigación A',
  //     tutor: 'Profesor Juan',
  //     cotutor: 'Profesora María',
  //     contenidoTrabajo: 'Resumen del trabajo A',
  //     estadoRevision: 'Pendiente',
  //     categoria: 'Investigación',
  //     idcomision: 101,
  //     idevento: 1001,
  //   ),
  //   Trabajo(
  //     idtrabajo: 2,
  //     titulo: 'Trabajo de Investigación B',
  //     tutor: 'Profesor Luis',
  //     cotutor: 'Profesora Ana',
  //     contenidoTrabajo: 'Resumen del trabajo B',
  //     estadoRevision: 'En Progreso',
  //     categoria: 'Desarrollo',
  //     idcomision: 102,
  //     idevento: 1002,
  //   ),
   
  // ])
  //   home :ProfesorComisionView(equipos: [
  //   Comision(tematica: "Tema 1", jefe: "Profesor A"),
  //   Comision(tematica: "Tema 2", jefe: "Profesor B"),
  //   Comision(tematica: "Tema 3", jefe: "Profesor C"),
  //   // Add more commissions here...
  // ])
              home: RegisterScreen(),
            ),
      ),
    );
  }
}
