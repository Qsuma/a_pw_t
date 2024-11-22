
import 'package:app_tesis_yaliana/providers/bloc/loguinBloc/provider.dart';
import 'package:app_tesis_yaliana/providers/event_provider.dart';
import 'package:app_tesis_yaliana/providers/student_provider.dart';
import 'package:app_tesis_yaliana/screens/AdminView/admin_home_screen.dart';



import 'package:app_tesis_yaliana/ui/theme.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
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
            create: (context) =>EstudianteProvider() ,
          ),
           ChangeNotifierProvider(
            create: (context) =>EventProvider() ,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App Eventos',
          theme: theme,
           home: const EventManagementScreen()
         // home: LoginScreen(),
        ),
      ),
    );
  }
}
