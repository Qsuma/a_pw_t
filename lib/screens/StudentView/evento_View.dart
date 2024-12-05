import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_tesis_yaliana/models/Event.dart';
import 'package:app_tesis_yaliana/providers/event_provider.dart';
import 'package:app_tesis_yaliana/widgets/CrearEventoScreen/date_widget.dart';
import 'package:app_tesis_yaliana/widgets/CrearEventoScreen/date_widget_year_only.dart';
import 'package:app_tesis_yaliana/widgets/esCopa.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;


class ShowEventView extends StatefulWidget {
  final Event event;
  const ShowEventView({super.key, required this.event});

  @override
  State<ShowEventView> createState() => _ShowEventViewState();
}

class _ShowEventViewState extends State<ShowEventView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SimpleDialog(
      backgroundColor: Colors.orange.shade300,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Mostrar Evento',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        const Divider(
          color: Colors.white,
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              final base64String = widget.event.plantilla;
              if (base64String != null && base64String.isNotEmpty) {
                // Decodificar la cadena base64
                Uint8List bytes = base64.decode(base64String);

                // Crear un Blob a partir de los bytes del PDF
                final blob = html.Blob([bytes]);

                // Crear una URL para el Blob (esto permite que el navegador lo trate como un archivo descargable)
                final url = html.Url.createObjectUrlFromBlob(blob);

                // Crear un enlace de descarga
                final anchor = html.AnchorElement(href: url)
                  ..target = 'blank'
                  ..download =
                      '${widget.event.nombreEvento}.pdf'; // Establecer el nombre del archivo a descargar

                // Simular un clic en el enlace para que el usuario pueda descargar el archivo
                anchor.click();

                // Liberar la URL del Blob para evitar problemas de memoria
                html.Url.revokeObjectUrl(url);

                // Mostrar mensaje de éxito
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blueAccent,
                    content: Text('Plantilla descargada con éxito'),
                  ),
                );
              } else {
                // Mostrar error si la plantilla es nula o vacía
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('No se encontró una plantilla válida'),
                  ),
                );
              }
            },
            child: Text(
              'Descargar Plantilla',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.redAccent),
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        _createContainer(context, size, widget.event),
      ],
    );
  }

  _createContainer(BuildContext context, Size size, Event event) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          color: Colors.white,
        ),
        height: size.height * 0.6,
        width: size.width * 0.6,
        child: Column(
          children: [
            _createContainerContents(event),
          ],
        ));
  }

  _createContainerContents(Event event) {
    return Expanded(
        flex: 7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _eventForm(event),
            ],
          ),
        ));
  }

  _eventForm(Event event) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ToggleCopaWidget(
                escopa: event.esCopa,
              ),
              IconButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      String base64String = base64Encode(
                          File(result.files.single.path!).readAsBytesSync());
                      //   plantilla = base64String;
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
                  ))
            ],
          ),

          const Divider(),
          Row(
            children: [
              Text(
                '${event.nombreEvento} Edicion: ${event.edicion}',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
              SizedBox(
                width: 200,
              ),
              // RomanNumeralInput(
              //   onChanged: (value) {
              //     setState(() {
              //       edicion = value;
              //     });
              //   },
              // ),
            ],
          ),
          const Divider(),
          Text(
            'Nivel: ${event.nivel}',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
          ),
          // SizedBox(child: SelectorTipoEvento())
          const Divider(),
          Row(
            children: [
              Text(
                "Nivel: ${event.lugar}",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
              SizedBox(
                width: 200,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  child: DateWidget(
                      text: 'Fecha Inicio : ${event.fechaInicioEvento}',
                      onSelect: (DateTime fecha) {
                        setState(() {});
                      })),
              SizedBox(
                  child: DateWidget(
                      text: 'Fecha Final ${event.fechaFinEvento}',
                      onSelect: (DateTime fecha) {
                        setState(() {});
                      })),
            ],
          ),
          const Divider(),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: 150,
            width: 600,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              '${event.descripcionEvento}',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
          DateYearWidget(
              text: 'Curso: ${event.curso}',
              onUpdate: (year) {
                setState(() {});
              }),
          SizedBox(
            height: 40,
          ),
          _createButtons(
            context,
          ),
        ],
      ),
    );
  }

  _createButtons(
    BuildContext context,
  ) {
    final eventProvider = Provider.of<EventProvider>(context);

    return Center(
      child: Wrap(
        children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red.shade400)),
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text("Cancel", style: TextStyle(color: Colors.black))),
          const SizedBox(
            width: 200,
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.blue.shade400)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Atras",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
