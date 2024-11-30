import 'package:app_tesis_yaliana/screens/AdminView/comision_view.dart';
import 'package:app_tesis_yaliana/screens/AdminView/event_view.dart';
import 'package:app_tesis_yaliana/screens/AdminView/register_profesor_screen.dart';
import 'package:flutter/material.dart';

class EventManagementScreen extends StatefulWidget {
  const EventManagementScreen({super.key});

  @override
  State<EventManagementScreen> createState() => _EventManagementScreenState();
}

class _EventManagementScreenState extends State<EventManagementScreen> {
  String _selectedView = 'Eventos';
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
                    'Administrador Screen',
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
                    _buildHeaderLinkWidget(
                      selectedView: _selectedView,
                      function: () {
                        setState(() {
                          _selectedView = 'Eventos';
                        });
                      },
                      text: 'Eventos',
                    ),
                    _buildHeaderLinkWidget(
                      selectedView: _selectedView,
                      function: () {
                        setState(() {
                          _selectedView = 'Comisión';
                        });
                      },
                      text: 'Comisión',
                    ),
                    _buildHeaderLinkWidget(
                      selectedView: _selectedView,
                      function: () {
                        setState(() {
                          _selectedView = 'Profesor';
                        });
                      },
                      text: 'Crear Profesor',
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      body: (_selectedView == 'Eventos')
          ? const EventView()
          : (_selectedView == 'Comisión')
              ? const ComisionView()
              : (_selectedView == 'Profesor')
                  ? RegisterProfesorScreen()
                  : Container(),
    );
  }
}

class _buildHeaderLinkWidget extends StatelessWidget {
  final String selectedView;
  final String text;
  final Function function;
  const _buildHeaderLinkWidget(
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
