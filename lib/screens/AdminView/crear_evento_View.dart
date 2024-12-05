// import 'dart:convert';
// import 'dart:io';

// import 'package:app_tesis_yaliana/providers/event_provider.dart';
// import 'package:app_tesis_yaliana/widgets/CrearEventoScreen/date_widget.dart';
// import 'package:app_tesis_yaliana/widgets/CrearEventoScreen/date_widget_year_only.dart';
// import 'package:app_tesis_yaliana/widgets/CrearEventoScreen/edicion_widget.dart';
// import 'package:app_tesis_yaliana/widgets/CrearEventoScreen/selector_nivel.dart';
// import 'package:app_tesis_yaliana/widgets/esCopa.dart';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CreateEventView extends StatefulWidget {
//   const CreateEventView({super.key});

//   @override
//   State<CreateEventView> createState() => _CreateEventViewState();
// }

// class _CreateEventViewState extends State<CreateEventView> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SimpleDialog(
//       backgroundColor: Colors.orange.shade300,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             const Text(
//               'Crear Evento',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//           ],
//         ),
//         const Divider(
//           color: Colors.white,
//         ),
//         const Center(
//             child: Text(
//           'Seleccione las características del evento:',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//         )),
//         const Divider(
//           color: Colors.white,
//         ),
//         _createContainer(context, size),
//       ],
//     );
//   }

//   _createContainer(BuildContext context, Size size) {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//           color: Colors.white,
//         ),
//         height: size.height * 0.6,
//         width: size.width * 0.6,
//         child: Column(
//           children: [
//             _createContainerContents(),
//           ],
//         ));
//   }

//   _createContainerContents() {
//     return Expanded(
//         flex: 7,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _eventForm(),
//             ],
//           ),
//         ));
//   }

//   _eventForm() {
//     String plantilla = '';
//     String nombreEvento = '';
//     String edicion = '';
//     bool convocatoria = false;
//     String nivel = '';
//     bool esCopa = false;
//     DateTime fechaInicioEvento = DateTime.now();
//     DateTime fechaFinEvento = DateTime.now();
//     String curso = '';
//     String lugar = '';
//     String descripcionEvento = '';

//     return Container(
//       padding: const EdgeInsets.only(left: 10),
//       width: double.infinity,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ToggleCopaWidget(
//                 onChanged: (bool value) {
//                   setState(() {
//                     esCopa = value;
//                   });
//                 },
//               ),
//               IconButton(
//                   onPressed: () async {
//                     FilePickerResult? result =
//                         await FilePicker.platform.pickFiles();

//                     if (result != null) {
//                       String base64String = base64Encode(
//                           File(result.files.single.path!).readAsBytesSync());
//                       plantilla = base64String;
//                       // Muestra un mensaje de éxito
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                             backgroundColor: Colors.blueAccent,
//                             content: Center(
//                                 child: Text(
//                               'PDF cargado con éxito',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20),
//                             ))),
//                       );
//                     } else {
//                       // User canceled the picker
//                     }
//                   },
//                   icon: const Icon(
//                     Icons.add_chart_rounded,
//                     color: Colors.blue,
//                     size: 35,
//                   ))
//             ],
//           ),

//           const Divider(),
//           Row(
//             children: [
//               Text(
//                 "Nombre del Evento: ",
//                 style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
//               ),
//               SizedBox(
//                   width: 200,
//                   child: TextField(
//                     onChanged: (value) => nombreEvento = value,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       hintText: '',
//                     ),
//                   )),
//               RomanNumeralInput(
//                 onChanged: (value) {
//                   setState(() {
//                     edicion = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//           const Divider(),
//           SelectorNivel(onValueChange: (value) {
//             setState(() {
//               nivel = value ?? '';
//             });
//           }),
//           // SizedBox(child: SelectorTipoEvento())
//           const Divider(),
//           Row(
//             children: [
//               Text(
//                 "Lugar del Evento:",
//                 style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
//               ),
//               SizedBox(
//                   width: 200,
//                   child: TextField(
//                     onChanged: (value) => lugar = value,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                       hintText: '',
//                     ),
//                   )),
//             ],
//           ),
//           const Divider(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SizedBox(
//                   child: DateWidget(
//                       text: 'Fecha Inicio',
//                       onSelect: (DateTime fecha) {
//                         setState(() {
//                           fechaInicioEvento = fecha;
//                         });
//                       })),
//               SizedBox(
//                   child: DateWidget(
//                       text: 'Fecha Final',
//                       onSelect: (DateTime fecha) {
//                         setState(() {
//                           fechaFinEvento = fecha;
//                         });
//                       })),
//             ],
//           ),
//           const Divider(),
//           Container(
//             decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//             height: 150,
//             width: 600,
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             child: TextField(
//               onChanged: (value) => descripcionEvento = value,
//               decoration: InputDecoration(
//                 labelText: 'Descripción',
//                 border: InputBorder.none,
//               ),
//               maxLength: 100,
//               maxLines: 3,
//               autocorrect: true,
//               textAlign: TextAlign.justify,
//               style: TextStyle(fontSize: 16, color: Colors.black),
//             ),
//           ),
//           DateYearWidget(
//               text: 'Curso: ',
//               onUpdate: (year) {
//                 setState(() {
//                   curso = year;
//                 });
//               }),
//           SizedBox(
//             height: 40,
//           ),
//           _createButtons(
//               context,
//               plantilla,
//               nombreEvento,
//               edicion,
//               convocatoria,
//               nivel,
//               esCopa,
//               fechaInicioEvento,
//               fechaFinEvento,
//               curso,
//               lugar,
//               descripcionEvento),
//         ],
//       ),
//     );
//   }

//   _createButtons(
//       BuildContext context,
//       String plantilla,
//       String nombreEvento,
//       String edicion,
//       bool convocatoria,
//       String nivel,
//       bool esCopa,
//       DateTime fechaInicioEvento,
//       DateTime fechaFinEvento,
//       String curso,
//       String lugar,
//       String descripcionEvento) {
//     final eventProvider = Provider.of<EventProvider>(context);

//     return Center(
//       child: Wrap(
//         children: [
//           TextButton(
//               style: ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(Colors.red.shade400)),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//                   const Text("Cancel", style: TextStyle(color: Colors.black))),
//           const SizedBox(
//             width: 200,
//           ),
//           TextButton(
//               style: ButtonStyle(
//                   backgroundColor:
//                       WidgetStatePropertyAll(Colors.blue.shade400)),
//               onPressed: () {
//                 eventProvider.postEvent(
//                     plantilla,
//                     nombreEvento,
//                     edicion,
//                     convocatoria,
//                     nivel,
//                     esCopa,
//                     fechaInicioEvento,
//                     fechaFinEvento,
//                     curso,
//                     lugar,
//                     descripcionEvento);
//               },
//               child: const Text(
//                 "Accept",
//                 style: TextStyle(color: Colors.black),
//               ))
//         ],
//       ),
//     );
//   }
// }
