import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CatalogoCorregido()));

class CatalogoCorregido extends StatelessWidget {
  const CatalogoCorregido({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vilca Market')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Arroz 1 kg',
                      style: TextStyle(
                        fontSize: 16, // Corregido: tamaño >= 14 sp
                        color: Colors
                            .black87, // Corregido: contraste adecuado >= 4.5:1
                      ),
                    ),
                    const Text(
                      'S/4.80',
                      style: TextStyle(
                        fontSize: 16, // Corregido: tamaño >= 14 sp
                        color: Colors
                            .black87, // Corregido: contraste adecuado >= 4.5:1
                      ),
                    ),
                    IconButton(
                      tooltip: 'Agregar al carrito', // Corregido: Nombre accesible para TalkBack
                      icon: const Icon(
                        Icons.add,
                        size: 24,
                      ), // Corregido: Tamaño de objetivo táctil adecuado
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
