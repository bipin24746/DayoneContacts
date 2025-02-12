import 'package:equatable/equatable.dart';

class CurrentFlatIntegration extends Equatable {
  final bool success;
  final List<Data> data;

  const CurrentFlatIntegration({
    required this.success,
    required this.data,
  });

  @override
  List<Object?> get props => [success, data];
}

class Data extends Equatable {
  final String name;
  final String id;
  final String floor;

  const Data({
    required this.name,
    required this.id,
    required this.floor,
  });

  @override
  List<Object?> get props => [name, id, floor];
}
