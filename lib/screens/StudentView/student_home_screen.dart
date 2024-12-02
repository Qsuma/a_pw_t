import 'package:app_tesis_yaliana/screens/StudentView/student_events_view.dart';
import 'package:app_tesis_yaliana/screens/StudentView/student_works_view.dart';
import 'package:flutter/material.dart';

class EventSelectorScreen extends StatefulWidget {
  const EventSelectorScreen({super.key});

  @override
  State<EventSelectorScreen> createState() => _EventSelectorScreenState();
}

class _EventSelectorScreenState extends State<EventSelectorScreen> {
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
                    'Student Screen',
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
                          _selectedView = 'Eventos';
                        });
                      },
                      text: 'Eventos',
                    ),
                    _BuildHeaderLinkWidget(
                      selectedView: _selectedView,
                      function: () {
                        setState(() {
                          _selectedView = 'Trabajos';
                        });
                      },
                      text: 'Trabajos',
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
          ? const StudentEventsView()
          : const StudentWorksView(),
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
