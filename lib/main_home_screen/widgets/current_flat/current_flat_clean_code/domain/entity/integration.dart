import 'package:equatable/equatable.dart';

class CurrentFlatIntegration extends Equatable {
  final bool success;
  final Data data;

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
class Floor extends Equatable{
  final String name;
  final String id;
  final String block;

  const Floor({
    required this.name, required this.id, required this.block
});


  @override
  // TODO: implement props
  List<Object?> get props => [name,id,block];}

class Block extends Equatable{
  final String id;
  final String name;
  final String apartment;

  const Block({
    required this.id,required this.name,required this.apartment
});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,apartment];}


class Apartment extends Equatable{
  final String id;
  final String name;
  final String area;
  final String city;

  const Apartment({
    required this.id,required this.name,required this.area,required this.city
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,area,city];

}
