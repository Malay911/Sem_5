class RxVariableController {
  final String name;
  final String type;
  final String value;

  RxVariableController({
    required this.name,
    required this.type,
    required this.value,
  });

  @override
  String toString() {
    return 'RxVariableController(name: $name, type: $type, value: $value)';
  }
}