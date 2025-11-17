import 'package:equatable/equatable.dart';
import 'package:mcp_toolkit/src/models/callable_property_schema.dart';

class CallableTool extends Equatable {
  const CallableTool({required this.toolName, this.toolDescription, this.properties, required this.requiredProperties});

  final String toolName;
  final String? toolDescription;
  final List<CallablePropertySchema>? properties;
  final List<String>? requiredProperties;

  @override
  List<Object?> get props => [toolName, toolDescription, properties, requiredProperties];
}
