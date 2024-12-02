import 'package:app_tesis_yaliana/models/Comision.dart';
import 'package:app_tesis_yaliana/screens/AdminView/create_comision_view.dart';
import 'package:flutter/material.dart';

class ComisionView extends StatelessWidget {
  const ComisionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Commissions",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF100E1B),
            ),
          ),
          const SizedBox(height: 32),
          ..._buildMemberList(),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CreateCommissionPage(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B19E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: SizedBox(
                  width: 200,
                  child: Center(
                    child: const Text(
                      "Crear Comsion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMemberList() {
    final List<Comision> comision = [
      Comision(tematica: 'Teatro', jefe: 'Pedro Ale'),
      Comision(tematica: 'Debate', jefe: 'Rey Jesus'),
      Comision(tematica: 'Arte', jefe: 'Yaliana Mendoza')
    ];

    return comision.map((comisions) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Icon(Icons.person_3_sharp),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comisions.tematica,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF100E1B),
                    ),
                  ),
                  Text(
                    comisions.jefe,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF100E1B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
