import 'package:app_tesis_yaliana/models/Event.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;  // Recibe el evento

  // Constructor
  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.nombreEvento),  // Muestra el nombre del evento en la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre del evento
              Text(
                event.nombreEvento,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Edición del evento
              Text(
                "Edición: ${event.edicion}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              // Descripción (si está disponible)
              if (event.descripcionEvento != null && event.descripcionEvento!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Descripción: ${event.descripcionEvento}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              // Fecha de inicio (si está disponible)
              if (event.fechaInicioEvento != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Fecha de inicio: ${event.fechaInicioEvento!.toLocal().toString().split(' ')[0]}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              // Fecha de fin (si está disponible)
              if (event.fechaFinEvento != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Fecha de fin: ${event.fechaFinEvento!.toLocal().toString().split(' ')[0]}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              // Lugar
              if (event.lugar.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Lugar: ${event.lugar}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              // Curso
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Curso: ${event.curso}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Nivel
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Nivel: ${event.nivel}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Es Copa
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Es Copa: ${event.esCopa ? 'Sí' : 'No'}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Convocatoria
              if (event.convocatoria != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Convocatoria: ${event.convocatoria! ? 'Abierta' : 'Cerrada'}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}