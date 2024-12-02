import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RomanNumeralInput extends StatefulWidget {
  final Function(String) onChanged;
  final String initialValue;

  const RomanNumeralInput({
    super.key,
    required this.onChanged,
    this.initialValue = '',
  });

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
    return SizedBox(
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
