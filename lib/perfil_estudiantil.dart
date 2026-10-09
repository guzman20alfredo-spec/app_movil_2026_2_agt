import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MiAppEstudiantil());

class MiAppEstudiantil extends StatelessWidget {
  const MiAppEstudiantil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil Estudiantil - APSTI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1), // Color institucional / azul académico
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(),
        ),
      ),
      home: const PantallaPerfilEstudiantil(),
    );
  }
}

class PantallaPerfilEstudiantil extends StatelessWidget {
  const PantallaPerfilEstudiantil({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Estudiante'),
        backgroundColor: colores.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            // Avatar o foto de perfil
            CircleAvatar(
              radius: 50,
              backgroundColor: colores.primary,
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            // Nombre del estudiante
            Text(
              'Alfredo Guzman Turpo',
              style: textos.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            // Carrera / Programa
            Text(
              'Arquitectura de Plataformas y Servicios de TI',
              style: textos.bodyMedium?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Tarjeta de información académica
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.school),
                      title: const Text('Semestre'),
                      subtitle: const Text('V Semestre - Presidente'),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.business),
                      title: const Text('Institución'),
                      subtitle: const Text('IESPP "Pedro Vilcapaza"'),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Correo Institucional'),
                      subtitle: const Text('71029934@tecnologicoazangaro.com'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Botón de acción para el módulo o ajustes
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Actualizar Datos Personales'),
            ),
          ],
        ),
      ),
    );
  }
}
