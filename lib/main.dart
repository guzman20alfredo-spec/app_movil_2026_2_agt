import 'package:flutter/material.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Perfil Académico Interactivo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PerfilAcademicoScreen(),
    );
  }
}

class PerfilAcademicoScreen extends StatefulWidget {
  const PerfilAcademicoScreen({super.key});

  @override
  State<PerfilAcademicoScreen> createState() => _PerfilAcademicoScreenState();
}

class _PerfilAcademicoScreenState extends State<PerfilAcademicoScreen> {
  final String nombreCompleto = "Alfredo Guzman Turpo";
  final int numeroPersonal = 34;
  final double promedioPonderado = 16.85;
  final bool estaMatriculado = true;

  late int logrosAcademicos;

  @override
  void initState() {
    super.initState();
    logrosAcademicos = numeroPersonal;
  }

  void _incrementarLogro() {
    setState(() {
      logrosAcademicos++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String parImpar = (numeroPersonal % 2 == 0)
        ? "Tu número personal es par"
        : "Tu número personal es impar";

    String rangoNp = (numeroPersonal > 50)
        ? "Número personal alto"
        : "Número personal bajo";

    List<int> multiplos = [];
    for (int i = 1; i <= 5; i++) {
      multiplos.add(numeroPersonal * i);
    }

    return Scaffold(
      appBar: AppBar(title: Text(nombreCompleto)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "1. Datos Personales y Variables (Sesión 02)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "• Nombre: $nombreCompleto",
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              "• Número Personal (NP): $numeroPersonal",
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              "• Promedio Ponderado: $promedioPonderado",
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              "• ¿Matriculado?: ${estaMatriculado ? 'Sí' : 'No'}",
              style: const TextStyle(fontSize: 15),
            ),
            const Divider(height: 30),

            const Text(
              "2. Clasificación con Estructura if-else (Sesión 02)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("• $parImpar", style: const TextStyle(fontSize: 15)),
            Text("• $rangoNp", style: const TextStyle(fontSize: 15)),
            const Divider(height: 30),

            const Text(
              "3. Múltiplos generados con Bucle for (Sesión 02)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...multiplos.map(
              (m) =>
                  Text("• Múltiplo: $m", style: const TextStyle(fontSize: 15)),
            ),
            const Divider(height: 30),

            const Text(
              "4. Interactividad con StatefulWidget y Hot Reload (Sesión 01 y 03)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Logros académicos: $logrosAcademicos",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _incrementarLogro,
              icon: const Icon(Icons.add),
              label: const Text("Sumar logro"),
            ),
          ],
        ),
      ),
    );
  }
}
