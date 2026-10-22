import 'package:flutter/material.dart';

class Anexo1Screen extends StatelessWidget {
  const Anexo1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1) Tamaño de la ventana completa usando MediaQuery.sizeOf(context)[cite: 7, 8]
    final anchoVentana = MediaQuery.sizeOf(context).width;

    // 3) Escalado de texto elegido por el usuario
    final escalaTexto = MediaQuery.textScalerOf(context).scale(16);

    return Scaffold(
      appBar: AppBar(title: const Text('Anexo 1 - UX/UI y Accesibilidad')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 2) Restricciones del padre y punto de quiebre (600 dp)[cite: 3, 7, 8]
          final esAncho = constraints.maxWidth >= 600;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                'Ancho de ventana: $anchoVentana | Escala de texto: $escalaTexto',
              ),
              const SizedBox(height: 16),

              Text(
                esAncho
                    ? 'Vista de Dos Columnas (≥ 600 dp)'
                    : 'Vista de Una Columna (< 600 dp)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Etiqueta para un icono interactivo sin texto[cite: 7]
              IconButton(
                tooltip: 'Agregar al carrito',
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {},
              ),
              const SizedBox(height: 16),

              // Semántica personalizada para un widget propio[cite: 7]
              const Semantics(
                label: 'Precio: 4 soles con 80 céntimos',
                child: Text('S/4.80', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 16),

              // Excluir un elemento puramente decorativo[cite: 7]
              const Row(
                children: [
                  Text('Calificación: '),
                  ExcludeSemantics(child: Icon(Icons.star, size: 12)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
