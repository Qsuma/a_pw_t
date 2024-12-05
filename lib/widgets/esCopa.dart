
import 'package:flutter/material.dart';

class ToggleCopaWidget extends StatefulWidget {
  final bool escopa;

  const ToggleCopaWidget({
    super.key, required this.escopa,
  });

  @override
  _ToggleCopaWidgetState createState() => _ToggleCopaWidgetState();
}

class _ToggleCopaWidgetState extends State<ToggleCopaWidget> {
 

  @override
  Widget build(BuildContext context) {
     bool isCopa = widget.escopa;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Es Copa?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 50,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCopa ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isCopa,
                  activeColor: Colors.white,
                  onChanged: (bool? value) {
                    setState(() {
                      isCopa = isCopa;
            
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Copa de Programación Competitva',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
