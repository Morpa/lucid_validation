import 'package:lucid_validation/src/validations/validations.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';

void main() {
  test('max length validation...', () {
    final validator = TestLucidValidator<UserModel>();
    validator
        .ruleFor((user) => user.password, key: 'password') //
        .minLength(8);

    final user = UserModel()..password = '123456';

    final result = validator.validate(user);

    expect(result.isValid, false);
    expect(result.exceptions.length, 1);
    expect(result.exceptions.first.message,
        "The length of 'password' must be at least 8 characters. You entered 6 characters.");
  });

  test('max length validation or null...', () {
    final validator = TestLucidValidator<UserNullableModel>();
    validator
        .ruleFor((user) => user.password, key: 'password') //
        .minLengthOrNull(8);

    final user = UserNullableModel()..password = null;

    final result = validator.validate(user);

    expect(result.isValid, true);
  });
}
