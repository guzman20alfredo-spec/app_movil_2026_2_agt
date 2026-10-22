import 'package:flutter/material.dart';
import '../models/product_args.dart';
import '../routes/app_routes.dart';
import '../widgets/section_title.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.args});

  final ProductArgs args;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;

  Future<void> _chooseQuantity() async {
    final result = await Navigator.pushNamed<int>(context, AppRoutes.quantity);
    if (!mounted) return;
    if (result != null) {
      setState(() => _quantity = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double total = widget.args.price * _quantity;

    return Scaffold(
      appBar: AppBar(title: Text(widget.args.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Descripción del producto'),
            const SizedBox(height: 8),
            Text(widget.args.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const SectionTitle(title: 'Detalle de costos'),
            const SizedBox(height: 8),
            Text('Precio unitario: S/ ${widget.args.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Cantidad seleccionada: $_quantity'),
            const SizedBox(height: 8),
            Text('Total a pagar: S/ ${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _chooseQuantity,
              icon: const Icon(Icons.edit),
              label: const Text('Cambiar cantidad'),
            ),
          ],
        ),
      ),
    );
  }
}
