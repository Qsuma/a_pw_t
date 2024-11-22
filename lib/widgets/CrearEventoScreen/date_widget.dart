import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  final String text;
  final Function(DateTime) onSelect;

  const DateWidget({super.key, required this.text, required this.onSelect});
  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  DateTime _fechaSeleccionada = DateTime.now();

  void _mostrarDialogoParaSeleccionarFecha() {
    showDatePicker(
      context: context,
      initialDate: _fechaSeleccionada,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((DateTime? nuevaFecha) {
      if (nuevaFecha != null) {
        setState(() {
          _fechaSeleccionada = nuevaFecha;
          widget.onSelect(_fechaSeleccionada);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${widget.text}: ${_fechaSeleccionada.day}/${_fechaSeleccionada.month}/${_fechaSeleccionada.year}',
          style:  const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
        IconButton(
            onPressed: _mostrarDialogoParaSeleccionarFecha,
            icon: const Icon(Icons.date_range_outlined))
      ],
    );
  }
}
