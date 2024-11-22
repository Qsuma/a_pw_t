import 'package:flutter/material.dart';

class SelectorToggleable extends StatefulWidget {
  const SelectorToggleable({super.key});

  @override
  _SelectorToggleableState createState() => _SelectorToggleableState();
}

class _SelectorToggleableState extends State<SelectorToggleable> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: _isSelected
                  ? Icon(Icons.check, key: UniqueKey())
                  : Icon(Icons.circle_outlined, key: UniqueKey()),
            ),
          ],
        ),
      ),
    );
  }
}
