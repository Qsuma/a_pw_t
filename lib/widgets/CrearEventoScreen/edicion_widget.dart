import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RomanNumeralInput extends StatefulWidget {
  final Function(String) onChanged;
  final String initialValue;

  const RomanNumeralInput({
    Key? key,
    required this.onChanged,
    this.initialValue = '',
  }) : super(key: key);

  @override
  _RomanNumeralInputState createState() => _RomanNumeralInputState();
}

class _RomanNumeralInputState extends State<RomanNumeralInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 30,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Edición',
          
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[IVXLCDM]+$')),
        ],
        onChanged: (value) {
          setState(() {
            widget.onChanged(value);
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}