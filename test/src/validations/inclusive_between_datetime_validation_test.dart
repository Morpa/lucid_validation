import 'package:lucid_validation/lucid_validation.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';

void main() {
  test('inclusive between validation ...', () {
    final validator = TestLucidValidator<EventModel>();
    final now = DateTime.now();
    final tomorrow = now.add(Duration(days: 1));
    final afterTomorrow = now.add(Duration(days: 2));

    validator
        .ruleFor((event) => event.dateEvent, key: 'dateEvent') //
        .inclusiveBetween(start: tomorrow, end: afterTomorrow);

    final event = EventModel()..dateEvent = now;

    final result = validator.validate(event);

    expect(result.isValid, false);
    expect(result.exceptions.length, 1);
    expect(result.exceptions.first.message,
        "'dateEvent' must be greater than or equal to '${tomorrow.toString()}' date and less than or equal to '${afterTomorrow.toString()}' date.");
  });

  test('inclusive between validation or null...', () {
    final validator = TestLucidValidator<EventNullableModel>();
    final now = DateTime.now();
    final tomorrow = now.add(Duration(days: 1));
    final afterTomorrow = now.add(Duration(days: 2));

    validator
        .ruleFor((event) => event.dateEvent, key: 'dateEvent') //
        .inclusiveBetweenOrNull(start: tomorrow, end: afterTomorrow);

    final event = EventNullableModel()..dateEvent = null;

    final result = validator.validate(event);

    expect(result.isValid, true);
  });
}
