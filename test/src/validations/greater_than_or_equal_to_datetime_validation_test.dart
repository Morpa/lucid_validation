import 'package:lucid_validation/lucid_validation.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';

void main() {
  test('greater than validation ...', () {
    final validator = TestLucidValidator<EventModel>();
    final now = DateTime.now();

    validator
        .ruleFor((event) => event.start, key: 'start') //
        .greaterThanOrEqualTo(now);

    final event = EventModel()..start = DateTime(2024, 8, 27);

    final result = validator.validate(event);

    expect(result.isValid, false);
    expect(result.exceptions.length, 1);
    expect(result.exceptions.first.message,
        "'start' must be greater than or equal to date '${now.toString()}'.");
  });

  test('greater than or equal to validation ...', () {
    final validator = TestLucidValidator<EventModel>();
    final now = DateTime.now();

    validator
        .ruleFor((event) => event.start, key: 'start') //
        .greaterThanOrEqualTo(now);

    final event = EventModel()..start = now;

    final result = validator.validate(event);

    expect(result.isValid, true);
  });

  test('greater than or equal to validation or null ...', () {
    final validator = TestLucidValidator<EventNullableModel>();
    final now = DateTime.now();

    validator
        .ruleFor((event) => event.start, key: 'start') //
        .greaterThanOrEqualToOrNull(now);

    final event = EventNullableModel()..start = null;

    final result = validator.validate(event);

    expect(result.isValid, true);
  });
}
