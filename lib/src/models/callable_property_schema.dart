import 'package:equatable/equatable.dart';

sealed class CallablePropertySchema extends Equatable {
  const CallablePropertySchema({this.name, this.description, this.isRequired});

  final String? name;
  final String? description;
  final bool? isRequired;

  Map<String, dynamic> toJson();

  String get jsonType;

  @override
  List<Object?> get props => [name, description, isRequired, jsonType];
}

final class StringPropertySchema extends CallablePropertySchema {
  const StringPropertySchema({super.name, super.description, super.isRequired});

  const StringPropertySchema.type() : super(name: null);

  @override
  String get jsonType => 'string';

  @override
  Map<String, dynamic> toJson() => {'type': jsonType, 'description': ?description};
}

final class BooleanPropertySchema extends CallablePropertySchema {
  const BooleanPropertySchema({super.name, super.description, super.isRequired});

  const BooleanPropertySchema.type() : super(name: null);

  @override
  String get jsonType => 'boolean';

  @override
  Map<String, dynamic> toJson() => {'type': jsonType, 'description': ?description};
}

final class NumberPropertySchema extends CallablePropertySchema {
  const NumberPropertySchema({super.name, super.description, super.isRequired});

  const NumberPropertySchema.type() : super(name: null);

  @override
  String get jsonType => 'number';

  @override
  Map<String, dynamic> toJson() => {'type': jsonType, 'description': ?description};
}

final class IntPropertySchema extends CallablePropertySchema {
  const IntPropertySchema({super.name, super.description, super.isRequired});

  const IntPropertySchema.type() : super(name: null);

  @override
  String get jsonType => 'integer';

  @override
  Map<String, dynamic> toJson() => {'type': jsonType, 'description': ?description};
}

final class ListPropertySchema extends CallablePropertySchema {
  const ListPropertySchema({super.name, super.description, super.isRequired, required this.type});

  final CallablePropertySchema type;

  @override
  String get jsonType => 'array';

  @override
  List<Object?> get props => [...super.props, type];

  @override
  Map<String, dynamic> toJson() => {
    'type': jsonType,
    'description': ?description,
    'items': type.toJson(),
  };
}

final class EnumPropertySchema extends CallablePropertySchema {
  const EnumPropertySchema({super.name, super.description, super.isRequired, required this.options});

  final List<String> options;

  @override
  String get jsonType => 'string';

  @override
  List<Object?> get props => [...super.props, options];

  @override
  Map<String, dynamic> toJson() => {
    'type': jsonType,
    'description': ?description,
    'enum': options,
  };
}

final class ObjectPropertySchema extends CallablePropertySchema {
  const ObjectPropertySchema({
    super.name,
    super.description,
    super.isRequired,
    this.properties,
    this.requiredProperties,
  });

  final List<CallablePropertySchema>? properties;
  final List<String>? requiredProperties;

  @override
  String get jsonType => 'object';

  @override
  List<Object?> get props => [...super.props, properties, requiredProperties];

  @override
  Map<String, dynamic> toJson() => {
    'type': jsonType,
    'description': ?description,
    if (properties case final properties?)
      'properties': {for (final property in properties) property.name: property.toJson()},
    'required': requiredProperties,
  };
}

final class NullPropertySchema extends CallablePropertySchema {
  const NullPropertySchema({required super.name, super.description, super.isRequired});

  @override
  String get jsonType => 'null';

  @override
  Map<String, dynamic> toJson() => {'type': jsonType, 'description': ?description};
}

final class InvalidPropertySchema extends CallablePropertySchema {
  const InvalidPropertySchema({required super.name, super.description, super.isRequired = false, required this.error});

  final String error;

  @override
  String get jsonType => 'invalid';

  @override
  List<Object?> get props => [...super.props, error];

  @override
  Map<String, dynamic> toJson() => {};
}
