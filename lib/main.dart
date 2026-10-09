import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ficha de tema',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), // TODO 1: hex de Theme Builder
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(),
        ), // TODO 2: fuente (poppins, lato)
      ),
      home: const PantallaTema(),
    );
  }
}

class PantallaTema extends StatelessWidget {
  const PantallaTema({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi tema Material 3'),
        backgroundColor: colores.primaryContainer, // TODO 3: token "contenedor primario"
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vilca Market', style: textos.headlineMedium),
            const SizedBox(height: 8),
            Text('Diseño coherente con Material 3', style: textos.bodyLarge),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.store), // TODO 4: ícono de tienda
                title: const Text('Catálogo de productos'),
                subtitle: const Text('Toca para explorar'),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Ir al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
