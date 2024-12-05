import 'package:app_tesis_yaliana/providers/work_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentWorksView extends StatefulWidget {
  const StudentWorksView({
    super.key,
  });

  @override
  State<StudentWorksView> createState() => _StudentWorksViewState();
}

class _StudentWorksViewState extends State<StudentWorksView> {
  @override
  Widget build(BuildContext context) {
    final workProvider = Provider.of<WorkProvider>(context);
    workProvider.getWorksE();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ListView.builder(
        itemCount: workProvider.works.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return (index == 0)
              ? _HeaderAppbarWidget()
              : _BuildWorkCardWidget(
                  description: workProvider.works[index - 1].categoria,
                  name: workProvider.works[index - 1].titulo,
                  status: workProvider.works[index - 1].estadoRevision,
                );
        },
      ),
    );
  }
}

//

class _BuildWorkCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String status;

  const _BuildWorkCardWidget({
    required this.name,
    required this.description,
    required this.status,
  });

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
                  name,
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
            StatusIndicator(status: status),
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
              'Lista de Sus Trabajos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '',
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

class StatusIndicator extends StatelessWidget {
  final String status;

  const StatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status.toLowerCase()) {
      case 'Completado':
        return CircleAvatar(
          radius: 15,
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white),
        );
      case 'Trabajando':
        return CircleAvatar(
          radius: 15,
          backgroundColor: Colors.orange,
          child: Icon(Icons.play_circle_filled, color: Colors.white),
        );
      case 'Pendiente':
        return CircleAvatar(
          radius: 15,
          backgroundColor: Colors.red,
          child: Icon(Icons.hourglass_empty, color: Colors.white),
        );
      default:
        return CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey[300],
          child: Text(status[0].toUpperCase()),
        );
    }
  }
}
