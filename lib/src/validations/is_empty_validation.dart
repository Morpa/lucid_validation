part of 'validations.dart';

/// Extension on [LucidValidationBuilder] for [String] properties to add an empty string validation.
///
/// This extension adds an `isEmpty` method that can be used to ensure that a string
/// is empty.
extension IsEmptyValidation on SimpleValidationBuilder<String> {
  /// Adds a validation rule that checks if the [String] is empty.
  ///
  /// [message] is the error message returned if the validation fails. Defaults to "Must be empty".
  /// [code] is an optional error code for translation purposes.
  ///
  /// Returns the [LucidValidationBuilder] to allow for method chaining.
  ///
  /// Example:
  /// ```dart
  /// ...
  /// ruleFor((user) => user.name, key: 'name')
  ///   .isEmpty();
  /// ```
  SimpleValidationBuilder<String> isEmpty({String message = 'Must be empty', String code = 'must_be_empty'}) {
    return must(
      (value) => value.isEmpty,
      message,
      code,
    );
  }
}
