import 'package:app_tesis_yaliana/providers/work_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfesorChangeWorkState extends StatefulWidget {
 
  const ProfesorChangeWorkState({super.key});

  @override
  _ProfesorChangeWorkStateState createState() =>
      _ProfesorChangeWorkStateState();
}

class _ProfesorChangeWorkStateState extends State<ProfesorChangeWorkState> {
  final List<String> estadosRevision = [
    'Pendiente',
    'Trabajando',
    'Completado'
  ];

  @override
  Widget build(BuildContext context) {
    final workProvider = Provider.of<WorkProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Estado de Revisión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: workProvider.works.length,
          itemBuilder: (context, index) {
            final trabajo = workProvider.works[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  trabajo.titulo,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Estado de revisión: ${trabajo.estadoRevision}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: estadosRevision.map((String estado) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          if (estado != trabajo.estadoRevision) {}
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                        ),
                        child: Text(estado),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
