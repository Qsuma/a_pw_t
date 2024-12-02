// ignore_for_file: non_constant_identifier_names

import 'package:app_tesis_yaliana/providers/bloc/loguinBloc/provider.dart';
import 'package:app_tesis_yaliana/providers/student_provider.dart';
import 'package:app_tesis_yaliana/screens/StudentView/student_home_screen.dart';
import 'package:app_tesis_yaliana/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class RegisterStudentScreen extends StatefulWidget {
  const RegisterStudentScreen({super.key});

  @override
  State<RegisterStudentScreen> createState() => _RegisterStudentScreenState();
}

class _RegisterStudentScreenState extends State<RegisterStudentScreen> {
    final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final userRegisterProvider = UserProvider();
  bool flag = true;
  bool flagConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_crearFondo(context), _register_form(context)],
    ));
  }

  Widget _crearFondo(BuildContext context) {
    final fondoMorado = Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: <Color>[Colors.black, Colors.blueAccent])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(top: -50.0, right: -10.0, child: circulo),
        Positioned(top: 120.0, right: 20.0, child: circulo),
        Positioned(top: -50.0, left: -20.0, child: circulo),
      ],
    );
  }

  Widget _register_form(BuildContext context) {
    final bloc = LoguinProviderBloc.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 100.0,
          )),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
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
                const Text(
                  'Inserte sus Datos de Estudiante',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                _crearName(bloc),
                const SizedBox(
                  height: 22.0,
                ),
                  _crearUser(bloc),
                const SizedBox(
                  height: 30.0,
                ),
                _crearPassword(bloc),
                const SizedBox(
                  height: 10.0,
                ),
                _crearFacultad(bloc),
                const SizedBox(
                  height: 22.0,
                ),
                // _crearEmail(bloc),
                // const SizedBox(
                //   height: 15.0,
                // ),
                _crearIndice(bloc),
                const SizedBox(
                  height: 22.0,
                ),
                _crearGrupo(bloc),
                const SizedBox(
                  height: 22.0,
                ),

                const SizedBox(
                  height: 20.0,
                ),
                _crearBoton(bloc)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ya tiene cuenta???'),
              GestureDetector(
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  // Widget _crearEmail(LoginBloc bloc) {
  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: flag,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: '**********',
              labelText: 'Contraseña',
              errorText: snapshot.error?.toString(),
              suffixIcon: IconButton(
                icon: Icon(flag ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() {
                  flag = !flag;
                }),
              ),
            ),
            onChanged: (value) {
              setState(() {});
              bloc.changePassword(value);
            },
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.registerStudentFormValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 0.0),
          onPressed: snapshot.hasData ? () => _register(bloc, context) : null,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            child: const Text('Ingresar'),
          ),
        );
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {
    final studentprovider =
        Provider.of<EstudianteProvider>(context, listen: false);
    final info = await studentprovider.postEstudiante(
        bloc.indice, bloc.facultad, bloc.grupo);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const EventSelectorScreen(),
    ));
    // if (info['ok']) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar( SnackBar(
    //         elevation: 100,
    //         backgroundColor: theme.primaryColor,
    //         content: const Center(child: Text('Registro Exitoso'))));
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => const EventSelectorScreen(),
    //   ));
    // } else {
    //   Alarm().showAlarm(context, 'Existe Mail', 'Error!!!');
    // }

//verifico
  }

  Widget _crearName(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Digite su Nombre y Apellidos',
              labelText: 'Nombre y Apellidos',
              errorText: snapshot.error?.toString(),
              suffixIcon: const Icon(Icons.account_circle_sharp),
            ),
            onChanged: (value) => bloc.changeName(
                value), //también se puede utilizar "bloc.changeEmail" en su lugar
          ),
        );
      },
    );
  }
  Widget _crearUser(LoginBloc bloc) {
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
  Widget _crearFacultad(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.facultadStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Digite su Facultad',
              labelText: 'Facultad',
              errorText: snapshot.error?.toString(),
              suffixIcon: const Icon(Icons.account_circle_sharp),
            ),
            onChanged: (value) => bloc.changeFacultad(
                value), //también se puede utilizar "bloc.changeEmail" en su lugar
          ),
        );
      },
    );
  }

  Widget _crearIndice(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.indiceStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Digite su Indice Académico',
              labelText: 'Indice: #.#',
              errorText: snapshot.error?.toString(),
              suffixIcon: const Icon(Icons.account_circle_sharp),
            ),
            onChanged: (value) => bloc.changeIndice(
                value), //también se puede utilizar "bloc.changeEmail" en su lugar
          ),
        );
      },
    );
  }

  Widget _crearGrupo(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.grupoStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Digite su Grupo',
              labelText: 'Grupo: ###',
              errorText: snapshot.error?.toString(),
              suffixIcon: const Icon(Icons.account_circle_sharp),
            ),
            onChanged: (value) => bloc.changeGrupo(
                value), //también se puede utilizar "bloc.changeEmail" en su lugar
          ),
        );
      },
    );
  }

  Widget _crearConfirmarPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.confirmarPasswordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
              obscureText: flagConfirm,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                hintText: '********',
                labelText: 'Confirmar Contraseña',
                errorText: snapshot.error?.toString(),
                suffixIcon: IconButton(
                  icon: Icon(
                      flagConfirm ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() {
                    flagConfirm = !flagConfirm;
                  }),
                ),
              ),
              onChanged: (value) {
                setState(() {});
                bloc.changeConfirmarPassword(value);
              } //también se puede utilizar "bloc.changeEmail" en su lugar
              ),
        );
      },
    );
  }
}
