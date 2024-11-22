import 'package:flutter/material.dart';

class CreateCommissionPage extends StatelessWidget {
  const CreateCommissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Card(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height*0.4,
            width: MediaQuery.sizeOf(context).width*0.8,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Nueva comisión",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF100E1B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Crea una nueva comisión para tu evento",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF5A4E97),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Nombre de la comisión",
                        hintText: "Ej. Comisión de Debate",
                        hintStyle: TextStyle(color: Color(0xFF5A4E97)),
                        filled: true,
                        fillColor: Color(0xFFF9F8FC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color(0xFFD4D0E7)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Jefe de comisión",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF100E1B),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: "Nombre del jefe de la Comision",
                        hintText: "Nombre y Apellidos",
                        hintStyle: TextStyle(color: Color(0xFF5A4E97)),
                        filled: true,
                        fillColor: Color(0xFFF9F8FC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color(0xFFD4D0E7)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                           // showDialog(context: context, builder: (context) => CreateCommissionPage(),);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B19E6),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Guardar comisión",
                            style: TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ),
      ],
    ) ; }}