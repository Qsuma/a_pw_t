import 'package:flutter/material.dart';

import 'login_bloc.dart';
export 'login_bloc.dart';

class LoguinProviderBloc extends InheritedWidget {
  static LoguinProviderBloc? _instance;

  factory LoguinProviderBloc({Key? key, Widget? child}) {
    _instance ??= LoguinProviderBloc._internal(key: key, child: child!);
    return _instance!;
  }

  LoguinProviderBloc._internal({super.key, required super.child});

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoguinProviderBloc>()
            as LoguinProviderBloc)
        .loginBloc;
  }
}
