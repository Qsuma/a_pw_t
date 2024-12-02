import 'package:flutter/material.dart';

class StudentRegisterView extends StatelessWidget {
  const StudentRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Registro",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "¡Bienvenido! Nos alegra que te unas a la comunidad de EduTech. "
              "Por favor, completa el formulario a continuación para registrarte.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 24),
            buildInputField(
                label: "Nombre y apellidos", placeholder: "Tu nombre"),
            buildInputField(
                label: "Índice académico", placeholder: "Tu índice académico"),
            buildDropdownField(
                label: "Facultad",
                options: ["Selecciona tu facultad", "Ingeniería", "Ciencias"]),
            buildDropdownField(
                label: "Grupo",
                options: ["Selecciona tu grupo", "Grupo A", "Grupo B"]),
            buildCheckbox(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  'Registrarse',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField({required String label, required String placeholder}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField(
      {required String label, required List<String> options}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            value: options[0],
            items: options
                .map((String option) => DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (newValue) {}),
          Expanded(
            child: Text(
              "Acepto los términos de servicio.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
