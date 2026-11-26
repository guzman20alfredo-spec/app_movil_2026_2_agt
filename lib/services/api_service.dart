import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiServiceRest {
  Future<void> consultarRecurso(String url) async {
    try {
      // Petición HTTP con control de tiempo límite (maneja TimeoutException)[cite: 8]
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 15));

      // Comprobación manual de códigos de estado[cite: 8]
      if (response.statusCode == 200) {
        // Éxito: decodificar texto JSON a Map o List usando dart:convert
        final dynamic datos = jsonDecode(response.body);
        print('Datos obtenidos con éxito: $datos');
      } else if (response.statusCode == 404) {
        print(
          'Error 404: El recurso solicitado no existe en el servidor[cite: 8].',
        );
      } else if (response.statusCode == 500) {
        print('Error 500: Fallo interno en el servidor.');
      } else {
        print('Código de estado inesperado: ${response.statusCode}');
      }
    } on SocketException {
      // Se detecta cuando el usuario no tiene conexión (ej. modo avión)[cite: 8]
      print('Excepción de red: Sin conexión a Internet.');
    } on TimeoutException {
      // Se detecta cuando la API tarda demasiado en responder[cite: 8]
      print('Excepción de tiempo: La solicitud tardó demasiado en responder.');
    } catch (e) {
      print('Ocurrió un error inesperado: $e');
    }
  }
}
