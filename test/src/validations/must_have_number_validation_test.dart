import 'package:lucid_validation/src/validations/validations.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';

void main() {
  test('must have number validation...', () {
    final validator = TestLucidValidator<UserModel>();
    validator
        .ruleFor((user) => user.password, key: 'password') //
        .mustHaveNumber();

    final user = UserModel()..password = 'AAAAaaa';

    final result = validator.validate(user);

    expect(result.isValid, false);
    expect(result.exceptions.length, 1);
    expect(result.exceptions.first.message,
        "'password' must have at least one digit ('0'-'9').");
  });

  test('must have number validation or null ...', () {
    final validator = TestLucidValidator<UserNullableModel>();
    validator
        .ruleFor((user) => user.password, key: 'password') //
        .mustHaveNumberOrNull();

    final user = UserNullableModel()..password = null;

    final result = validator.validate(user);

    expect(result.isValid, true);
  });
}
