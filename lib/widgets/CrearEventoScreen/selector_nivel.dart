import 'package:flutter/material.dart';

class SelectorNivel extends StatefulWidget {
  final Function(String?) onValueChange;

  const SelectorNivel({super.key, required this.onValueChange});

  @override
  _SelectorNivelState createState() => _SelectorNivelState();
}

class _SelectorNivelState extends State<SelectorNivel> {
  String? _opcionSeleccionada;

  void _actualizarValor(String? valor) {
    setState(() {
      _opcionSeleccionada = valor;
      widget.onValueChange(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nivel:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text('Facultad'),
                leading: Radio<String?>(
                  value: 'facultad',
                  groupValue: _opcionSeleccionada,
                  onChanged: (String? newValue) => _actualizarValor(newValue),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('UCI'),
                leading: Radio<String?>(
                  value: 'uci',
                  groupValue: _opcionSeleccionada,
                  onChanged: (String? newValue) => _actualizarValor(newValue),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('Nacional'),
                leading: Radio<String?>(
                  value: 'nacional',
                  groupValue: _opcionSeleccionada,
                  onChanged: _actualizarValor,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('Internacional'),
                leading: Radio<String?>(
                  value: 'internacional',
                  groupValue: _opcionSeleccionada,
                  onChanged: _actualizarValor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
