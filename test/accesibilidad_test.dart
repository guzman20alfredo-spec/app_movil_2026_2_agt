import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('La pantalla cumple las guías de accesibilidad', (tester) async {
    final handle = tester.ensureSemantics();

    // Evaluaciones automáticas de las guías de accesibilidad[cite: 8]
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));

    handle.dispose();
  });
}
