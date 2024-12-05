import 'dart:convert';
import 'dart:io';

import 'package:app_tesis_yaliana/models/Event.dart';
import 'package:app_tesis_yaliana/providers/event_provider.dart';
import 'package:app_tesis_yaliana/screens/StudentView/evento_View.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ADEventsView extends StatefulWidget {
  const ADEventsView({
    super.key,
  });

  @override
  State<ADEventsView> createState() => _ADEventsViewState();
}

class _ADEventsViewState extends State<ADEventsView> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child:
          // _buildHeaderSectionWidget(title: 'Gestionar Eventos',buttonText: 'Añadir Evento',function: (){
          //   showDialog(context: context, builder: (context) => const CreateEventView(),);
          // },),

          ListView.builder(
        itemCount: eventProvider.eventos.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return (index == 0)
              ? _HeaderAppbarWidget()
              : _BuildEventCardWidget(
                  event: eventProvider.eventos[index - 1],
                  description:
                      (eventProvider.eventos[index - 1].descripcionEvento !=
                              null)
                          ? eventProvider.eventos[index - 1].descripcionEvento!
                          : '',
                  title: eventProvider.eventos[index - 1].nombreEvento);
        },
      ),
      //showDialog(context: context, builder: (context) => const CreateEventView(),);
    );
  }
}

//

class _BuildEventCardWidget extends StatelessWidget {
  final String description;
  final Event event;
  final String title;
  const _BuildEventCardWidget(
      {required this.description, required this.title, required this.event});

  @override
  Widget build(BuildContext context) {
    String plantilla = '';
    final eventprovider = Provider.of<EventProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    String base64String = base64Encode(
                        File(result.files.single.path!).readAsBytesSync());
                    plantilla = base64String;
                    eventprovider.patchEvent(
                        plantilla,
                        event.nombreEvento,
                        event.edicion,
                        event.convocatoria!,
                        event.nivel,
                        event.esCopa,
                        event.fechaInicioEvento!,
                        event.fechaFinEvento!,
                        event.curso,
                        event.lugar,
                        event.descripcionEvento!);
                    // Muestra un mensaje de éxito
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.blueAccent,
                          content: Center(
                              child: Text(
                            'PDF cargado con éxito',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ))),
                    );
                  } else {
                    // User canceled the picker
                  }
                },
                icon: const Icon(
                  Icons.add_chart_rounded,
                  color: Colors.blue,
                  size: 35,
                )),
          ],
        ),
      ),
    );
  }
}

class _buildHeaderSectionWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function function;
  const _buildHeaderSectionWidget(
      {required this.title, required this.function, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Wrap(
            alignment: WrapAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HeaderAppbarWidget extends StatelessWidget {
  const _HeaderAppbarWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('/assets/horizontal.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Seleccione Eventos para añadir Plantilla',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lista de Eventos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
