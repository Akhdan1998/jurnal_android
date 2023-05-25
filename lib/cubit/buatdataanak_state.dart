part of 'buatdataanak_cubit.dart';

abstract class BuatdataanakState extends Equatable {
  @override
  List<Object> get props => [];
}

class BuatdataanakInitial extends BuatdataanakState {}

class BuatdataanakLoaded extends BuatdataanakState {
  final List<BuatDataAnak>? dataanak;

  BuatdataanakLoaded({this.dataanak});

  @override
  List<Object> get props => [dataanak!];
}

class BuatdataanakLoadingFailed extends BuatdataanakState {
  final String? message;

  BuatdataanakLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}

