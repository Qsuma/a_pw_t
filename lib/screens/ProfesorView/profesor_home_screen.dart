import 'package:app_tesis_yaliana/screens/ProfesorView/comision_view.dart';
import 'package:flutter/material.dart';

class ComisionSelectorScreen extends StatefulWidget {
  const ComisionSelectorScreen({super.key});

  @override
  State<ComisionSelectorScreen> createState() => _ComisionSelectorScreenState();
}

class _ComisionSelectorScreenState extends State<ComisionSelectorScreen> {
  String _selectedView = 'Comision';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Wrap(
              children: [
                const Icon(Icons.event, color: Colors.black),
                const SizedBox(width: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const Text(
                    'Profesor Screen',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    _BuildHeaderLinkWidget(
                      selectedView: _selectedView,
                      function: () {
                        setState(() {
                          _selectedView = 'Comision';
                        });
                      },
                      text: 'Comision',
                    ),
                    _BuildHeaderLinkWidget(
                      selectedView: _selectedView,
                      function: () {
                        setState(() {
                          _selectedView = 'Opciones';
                        });
                      },
                      text: 'Opciones',
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      body: (_selectedView == 'Comision')
          ?  ProfesorComisionView()
          :  Container(),
    );
  }
}

class _BuildHeaderLinkWidget extends StatelessWidget {
  final String selectedView;
  final String text;
  final Function function;
  const _BuildHeaderLinkWidget(
      {required this.text, required this.function, required this.selectedView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: (selectedView == text)
                ? const WidgetStatePropertyAll(Colors.blue)
                : const WidgetStatePropertyAll(Colors.white)),
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
