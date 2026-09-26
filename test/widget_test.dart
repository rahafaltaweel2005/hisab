import 'package:flutter_test/flutter_test.dart';

import 'package:hiasb_app/features/auth/data/model/register_response_model.dart';

void main() {
  test('RegisterResponseModel parses token and nested user', () {
    final model = RegisterResponseModel.fromJson({
      'accessToken': 'abc123',
      'expiresAt': '2026-09-27T10:00:00+00:00',
      'user': {
        'id': 'u1',
        'displayName': 'Mohammad',
        'email': 'm@example.com',
      },
    });

    expect(model.accessToken, 'abc123');
    expect(model.expiresAt, '2026-09-27T10:00:00+00:00');

    final user = model.toEntity();
    expect(user.id, 'u1');
    expect(user.displayName, 'Mohammad');
    expect(user.email, 'm@example.com');
  });
}
