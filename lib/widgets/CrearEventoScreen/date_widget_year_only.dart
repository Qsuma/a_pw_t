import 'package:flutter/material.dart';

class DateYearWidget extends StatefulWidget {
  final String text;
  final Function(String) onUpdate;

  const DateYearWidget({super.key, required this.text, required this.onUpdate});
  
  @override
  _DateYearWidgetState createState() => _DateYearWidgetState();
}

class _DateYearWidgetState extends State<DateYearWidget> {
    DateTime _year=DateTime.now();

  void _mostrarDialogoParaSeleccionarFecha() {
    showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((DateTime? nuevaFecha) {
      if (nuevaFecha != null) {
        setState(() {
          _year = nuevaFecha;
          widget.onUpdate('${_year.year}-${_year.year+1}');
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
          '${widget.text}: ${_year.year}-${_year.year+1}',
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
        IconButton(
            onPressed: _mostrarDialogoParaSeleccionarFecha,
            icon: const Icon(Icons.date_range_outlined))
      ],
    );
  }
}
