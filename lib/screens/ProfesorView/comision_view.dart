import 'package:app_tesis_yaliana/providers/comision_provider.dart';
import 'package:app_tesis_yaliana/providers/work_provider.dart';
import 'package:app_tesis_yaliana/screens/ProfesorView/profesor_comision_work_view.dart';
import 'package:app_tesis_yaliana/utils/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfesorComisionView extends StatelessWidget {
  const ProfesorComisionView({super.key});

  @override
  Widget build(BuildContext context) {
    final comisionProvider = Provider.of<ComisionProvider>(context);
    final equipos = comisionProvider.comisions;
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipos de Trabajo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: equipos.length + 1, // Número de equipos en la lista
          itemBuilder: (context, index) {
            return (index == 0)
                ? _HeaderAppbarWidget()
                : Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            crearRuta(
                                FutureBuilder(
                                  future: WorkProvider().getWorksByComisionId(
                                      equipos[index - 1].id.toString()),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SizedBox.shrink();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      return ProfesorChangeWorkState();
                                    }
                                    return Container();
                                  },
                                ),
                                Duration(milliseconds: 500)));
                      },
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        equipos[index - 1].jefe,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Líder: ${equipos[index - 1].jefe}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Icon(Icons.group),
                    ),
                  );
          },
        ),
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
              'Seleccione Comision en la que participa',
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
