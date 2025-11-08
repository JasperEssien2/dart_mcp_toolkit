import 'package:equatable/equatable.dart';

class CallableToolInput {
  const CallableToolInput({required this.name, required this.description});

  final String name;
  final String description;
}

class CallableToolProperty extends Equatable {
  const CallableToolProperty({
    required this.description,
    this.isRequired = true,
    this.name,
  });

  final String description;
  final bool isRequired;
  final String? name;

  @override
  List<Object?> get props => [description, isRequired, name];
}
