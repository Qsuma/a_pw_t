import 'package:flutter/material.dart';

class SelectorTipoEvento extends StatefulWidget {
  const SelectorTipoEvento({super.key});

  @override
  _SelectorTipoEventoState createState() => _SelectorTipoEventoState();
}

class _SelectorTipoEventoState extends State<SelectorTipoEvento> {
  bool _opcionSeleccionada = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Checkbox(
                splashRadius: 10,
                value: _opcionSeleccionada,
                onChanged: (value) {
                setState(() {
                  _opcionSeleccionada = !_opcionSeleccionada;
                });
              },
              ),
            ),
            const Text('Copa de Programacion Competitva OJO******',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
          ],
        )
      ],
    );
  }
}
