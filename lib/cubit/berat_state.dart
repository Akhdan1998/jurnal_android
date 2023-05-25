import 'package:equatable/equatable.dart';

import '../Models/model_berat.dart';

abstract class BeratState extends Equatable {
  @override
  List<Object> get props => [];
}

class BeratInitial extends BeratState {}

class BeratLoaded extends BeratState {
  final List<Berat>? berat;

  BeratLoaded({this.berat});

  @override
  List<Object> get props => [berat!];
}

class BeratLoadingFailed extends BeratState {
  final String? message;

  BeratLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
