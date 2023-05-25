import 'package:equatable/equatable.dart';

import '../Models/model_grafikBerat.dart';

abstract class GrafikBeratState extends Equatable {
  @override
  List<Object> get props => [];
}

class GrafikBeratInitial extends GrafikBeratState {}

class GrafikBeratLoaded extends GrafikBeratState {
  final GrafikBeratResponse? grafikberat;

  GrafikBeratLoaded({this.grafikberat});

  @override
  List<Object> get props => [grafikberat!];
}

class GrafikBeratLoadingFailed extends GrafikBeratState {
  final String? message;

  GrafikBeratLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
