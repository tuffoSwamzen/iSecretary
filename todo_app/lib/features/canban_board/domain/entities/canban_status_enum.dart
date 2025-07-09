enum CanbanStatusEnum { toBeDone, isDoing, done }

extension CanbanStatusEnumJson on CanbanStatusEnum {
  /// Umwandlung in einen JSON-kompatiblen String
  String toJson() => name;

  /// Deserialisierung aus einem String
  static CanbanStatusEnum fromJson(String value) {
    return CanbanStatusEnum.values.firstWhere(
      (e) => e.name == value,
      orElse: () => CanbanStatusEnum.toBeDone, // optionaler Fallback
    );
  }
}
