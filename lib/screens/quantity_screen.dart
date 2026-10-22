import 'package:flutter/material.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/section_title.dart';

class QuantityScreen extends StatefulWidget {
  const QuantityScreen({super.key});

  @override
  State<QuantityScreen> createState() => _QuantityScreenState();
}

class _QuantityScreenState extends State<QuantityScreen> {
  int _currentQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar cantidad')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SectionTitle(title: 'Ajuste de unidades'),
            const SizedBox(height: 24),
            QuantitySelector(
              value: _currentQuantity,
              min: 1,
              max: 20,
              onChanged: (newValue) {
                setState(() {
                  _currentQuantity = newValue;
                });
              },
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => Navigator.pop(context, _currentQuantity),
              icon: const Icon(Icons.check),
              label: const Text('Confirmar cantidad'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
