import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mi_perfil_app/models/login_response.dart';

void main() {
  test('LoginResponse.fromJson lee los campos del JSON', () {
    const raw =
        '{"id":1,"username":"emilys","email":"e@x.com",'
        '"firstName":"Emily","lastName":"Johnson",'
        '"accessToken":"a.b.c","refreshToken":"d.e.f"}';

    final r = LoginResponse.fromJson(jsonDecode(raw) as Map<String, dynamic>);

    expect(r.id, 1);
    expect(r.firstName, 'Emily');
    expect(r.image, isNull);
    expect(r.toJson()['username'], 'emilys');
  });
}
