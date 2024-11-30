import 'package:app_tesis_yaliana/utils/route_animation.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Usuario'), // Nombre del usuario
            accountEmail: Text('usuario@example.com'), // Email del usuario
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/perfil.jpeg'), // Imagen de perfil
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person), // Icono para ver el perfil
            title: const Text('Ver Perfil'),
            onTap: () {
              // Acción para ver el perfil
              // Implementa la lógica aquí
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app), // Icono para cerrar sesión
            title: const Text('Crear Matrimonio'),
            onTap: () {
              // Acción para cerrar la cuenta
              // Implementa la lógica aquís
              Navigator.push(
                  context,
                  crearRuta(Container(),
                      const Duration(seconds: 1))); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app), // Icono para cerrar sesión
            title: const Text('Cerrar Cuenta'),
            onTap: () {
              // Acción para cerrar la cuenta
              // Implementa la lógica aquís
              Navigator.pushReplacement(
                  context,
                  crearRuta(const LoginScreen(),
                      const Duration(seconds: 1))); // Cierra el Drawer
            },
          ),
        ],
      ),
    );
  }
}
