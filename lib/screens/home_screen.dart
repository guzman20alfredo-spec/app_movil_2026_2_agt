import 'package:flutter/material.dart';
import '../models/product_args.dart';
import '../routes/app_routes.dart';
import '../widgets/product_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vilca Market')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(title: 'Productos de la región'),
          const SizedBox(height: 8),
          ProductCard(
            name: 'Quinua orgánica 1 kg',
            price: 12.50,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: const ProductArgs(
                  name: 'Quinua orgánica 1 kg',
                  price: 12.50,
                  description: 'Quinua selecta del altiplano puneño.',
                ),
              );
            },
          ),
          ProductCard(
            name: 'Chuño blanco 500 g',
            price: 9.00,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: const ProductArgs(
                  name: 'Chuño blanco 500 g',
                  price: 9.00,
                  description: 'Chuño blanco tradicional de la región Puno.',
                ),
              );
            },
          ),
          ProductCard(
            name: 'Queso paria 250 g',
            price: 11.00,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: const ProductArgs(
                  name: 'Queso paria 250 g',
                  price: 11.00,
                  description: 'Queso paria artesanal de excelente calidad.',
                ),
              );
            },
          ),
          ProductCard(
            name: 'Miel de abeja 350 ml',
            price: 18.00,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: const ProductArgs(
                  name: 'Miel de abeja 350 ml',
                  price: 18.00,
                  description: 'Miel de abeja 100% pura y natural.',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
// 1) Etiqueta para un icono interactivo sin texto[cite: 7]
IconButton(
  tooltip: 'Agregar al carrito', 
  icon: const Icon(Icons.add_shopping_cart),
  onPressed: () {},
),

// 2) Semántica personalizada para un widget propio[cite: 7]
Semantics(
  label: 'Precio: 4 soles con 80 céntimos',
  child: const Text('S/4.80'),
),

// 3) Excluir un elemento puramente decorativo[cite: 7]
const ExcludeSemantics(
  child: Icon(Icons.star, size: 12),
)