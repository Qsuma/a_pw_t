import 'package:app_tesis_yaliana/models/Event.dart';
import 'package:app_tesis_yaliana/providers/event_provider.dart';
import 'package:app_tesis_yaliana/screens/StudentView/evento_View.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentEventsView extends StatefulWidget {
  const StudentEventsView({
    super.key,
  });

  @override
  State<StudentEventsView> createState() => _StudentEventsViewState();
}

class _StudentEventsViewState extends State<StudentEventsView> {
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
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ShowEventView(event: event),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0d7cf2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Ver',
                style: TextStyle(color: Colors.white),
              ),
            ),
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
              'Seleccione Eventos a participar',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorep Ipsum',
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
