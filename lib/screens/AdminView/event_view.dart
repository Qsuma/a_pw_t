import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
  const EventView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ListView(
        children: [
          // _buildHeaderSectionWidget(title: 'Gestionar Eventos',buttonText: 'Añadir Evento',function: (){
          //   showDialog(context: context, builder: (context) => const CreateEventView(),);
          // },),
          _headerAppbarWidget(
              buttonText: 'Añadir Evento',
              function: () {
                // showDialog(
                //   context: context,
                //   builder: (context) => const CreateEventView(),
                // );
              }),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          const _buildEventCardWidget(
            title: 'Event Name',
            description: 'Event Description',
          ),
          //showDialog(context: context, builder: (context) => const CreateEventView(),);
        ],
      ),
    );
  }
}

//

class _buildEventCardWidget extends StatelessWidget {
  final String description;
  final String title;
  const _buildEventCardWidget({required this.description, required this.title});

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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0d7cf2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Edit'),
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

class _headerAppbarWidget extends StatelessWidget {
  final String buttonText;
  final Function function;
  const _headerAppbarWidget({required this.function, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
              'https://cdn.usegalileo.ai/stability/e27fa3a1-db88-49ca-bba9-7da4c5b1508c.png'),
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
              'Gestionar Eventos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cree Eventos a solo un clic',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                function();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
