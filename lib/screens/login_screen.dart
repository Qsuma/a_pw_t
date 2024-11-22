import 'package:app_tesis_yaliana/providers/bloc/loguinBloc/provider.dart';
import 'package:app_tesis_yaliana/screens/AdminView/admin_home_screen.dart';
import 'package:app_tesis_yaliana/screens/StudentView/register_student_screen.dart';
import 'package:app_tesis_yaliana/screens/StudentView/student_register_view.dart';

import 'package:app_tesis_yaliana/screens/register_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';
import '../utils/preferencias_usuario.dart';
import '../utils/route_animation.dart';
import '../widgets/alarms_dialog.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final prefs = PreferenciasDeUsuario();
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  bool showpass = true;
  final userRegisterProvider = UserProvider();
  @override
  void initState() {
    super.initState();

    final username = prefs.usuario;
    final password = prefs.password;
    _usernameController.text = username;
    _passwordController.text = password;
    if (username != '') {
      _login();
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: Stack(
            children: <Widget>[crearFondo(context), login_form(context)],
          ),
        ));
  }

  Widget crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.40,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: <Color>[Colors.black, Colors.green])),
    );
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          fondoMorado,
           const Positioned(
                  top: -40.0,
                  left: 400.0,
                  child: circulo(
                    duration: Duration(seconds: 1),
                    radius: 100,
                  )),
          const Positioned(
                  top: -10.0,
                 right:-10,
                  child: circulo(
                     duration: Duration(seconds: 1),
                    radius: 100,
                  )),
          const Positioned(
                  top: 180.0,
                  left: 10,
                  child: circulo(
                     duration: Duration(seconds: 1),
                    radius: 100,
                  )),
          const Positioned(
              top: 120.0,
              right: 100,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),
          const Positioned(
              top: -50.0,
              left: -20.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),
              const Positioned(
              top: -20.0,
              left: 160.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
             bottom: 30,
              right: 300.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              bottom: -10,
              left: 170.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              top: 50,
              right: 200.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              top: 170,
              left: 800.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              top: -80,
              left: 700.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              top: 200,
              left: 300.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              top: 80,
              left: 1000.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),const Positioned(
              top: 190,
              left: 480.0,
              child: circulo(
                 duration: Duration(seconds: 1),
                radius: 100,
              )),
          Container(
            padding: const EdgeInsets.only(top: 0.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Bounce(
                    duration: const Duration(seconds: 3),
                    child: Spin(
                      child: const Icon(Icons.event,
                      size: 40,
                      color: Colors.blue,),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0, width: double.infinity),
                const Text(
                  'Eventos WEB',
                  style: TextStyle(
                      color: Color.fromARGB(255, 147, 147, 147),
                      fontSize: 25.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget login_form(BuildContext context) {
    final bloc = LoguinProviderBloc.of(context);
    final size = MediaQuery.of(context).size;
//saqui

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: <Widget>[
          // distancia
          Container(
            height: 200,
          ),

          Container(
            width: size.width * 0.33,
               
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 0.5),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _crearNombre(bloc),
                const SizedBox(
                  height: 30.0,
                ),
                _crearPassword(bloc),
                const SizedBox(
                  height: 10.0,
                ),
                checkbox(),
                const SizedBox(
                  height: 10.0,
                ),
                _crearBoton(bloc),
              ],
            ),
          ),
          //TeXTO A pantalla de registro
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No tienes cuenta?'),
              GestureDetector(
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushReplacement(context,
                      crearRuta(const RegisterScreen(), const Duration(microseconds: 700)));
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Row checkbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: prefs.Rememberme,
          onChanged: (value) => setState(() {
            prefs.Rememberme = !prefs.Rememberme;
          }),
        ),
        const Text('Recordar')
      ],
    );
  }

  Widget _crearNombre(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller: _usernameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Inserte Usuario',
              labelText: 'Usuario',
              errorText: snapshot.error?.toString(),
              suffixIcon: const Icon(Icons.person_2_outlined),
            ),
            onChanged: (value) => bloc.changeUser(value),
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(

              // aqui es donde se va a hacer
              controller: _passwordController,
              obscureText: showpass,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: '**********',
                  labelText: 'Contraseña',
                  errorText: snapshot.error?.toString(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      !showpass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        showpass = !showpass;
                      });
                    },
                  )),
              onChanged: bloc.changePassword),
        );
      },
    );
  }

  Widget _crearBoton(
    LoginBloc bloc,
  ) {
    String botontext = 'Login';
    return StreamBuilder(
      stream: bloc.loginFormValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 0.0),
          onPressed: snapshot.hasData
              ? () {
                  _login();
                }
              : null,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            child: Text(botontext),
          ),
        );
      },
    );
  }

  _login() async {
    //aqui va el coso dese de cargar mientras espera
//TODO: ENVIAR ID
    Map info = await userRegisterProvider.loginUser(
        _usernameController.text, _passwordController.text);

    if (info['ok']) {
      if (prefs.Rememberme) {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('usuario', _usernameController.text);
          prefs.setString('password', _passwordController.text);
        });
      } else {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('usuario', '');
          prefs.setString('password', '');
        });
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        crearRuta(
            (prefs.rol=='Estudiante')? const RegisterStudentScreen(): const EventManagementScreen(),
            //RegisterScreen(),
            const Duration(milliseconds: 700)),
      );
    } else {
      Alarm().showAlarm(context, 'Error', 'Datos Incorrectos');
    }

    /*.then((value) {
      if (screensize.width >= 500) {
        Navigator.push(
            context,
            crearRuta(
                HomeScreenTV(
                  height: 0.8,
                  width: 0.6,
                ),
                Duration(milliseconds: 700)));
      } //animcion abajo
      else
        Navigator.push(
          context,
          crearRuta(
              HomeScreen(height: 0.5, width: 0.6),
              //RegisterScreen(),e
              Duration(milliseconds: 700)),
        );
    });
*/
    //if ( == 200) {

    //}
    // else {

    // }
  }
}

class circulo extends StatelessWidget {
  final double radius;
  final Duration duration;
  const circulo({
    super.key,
    required this.radius, required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: duration,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: const Color.fromARGB(122, 255, 255, 255)),
      ),
    );
  }
}
/*class prov extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MoviesProviders(),
        lazy: false,
      ),
    ]);
  }
}*/
