import 'package:lucid_validation/lucid_validation.dart';
import 'package:test/test.dart';

import '../../mocks/mocks.dart';

void main() {
  test('valid cep validation ...', () {
    final validator = TestLucidValidator<Address>();

    validator
        .ruleFor((e) => e.postcode, key: 'postcode') //
        .validCEP();

    var customer = Address(
      country: 'Brazil',
      postcode: '1234578',
    );

    final result = validator.validate(customer);

    expect(result.isValid, false);

    expect(result.exceptions.length, 1);

    final error = result.exceptions.first;

    expect(error.message, "'postcode' is not a valid CEP.");
  });

  test('valid cep validation or null ...', () {
    final validator = TestLucidValidator<AddressNullable>();

    validator
        .ruleFor((e) => e.postcode, key: 'postcode') //
        .validCEPOrNull();

    var customer = AddressNullable();

    final result = validator.validate(customer);

    expect(result.isValid, true);
  });
}
