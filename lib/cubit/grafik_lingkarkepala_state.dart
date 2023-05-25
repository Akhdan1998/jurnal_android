import 'package:equatable/equatable.dart';

import '../Models/model_grafikLK.dart';

abstract class GrafikLKState extends Equatable {
  @override
  List<Object> get props => [];
}

class GrafikLKInitial extends GrafikLKState {}

class GrafikLKLoaded extends GrafikLKState {
  final GrafikLKResponse? grafiklk;

  GrafikLKLoaded({this.grafiklk});

  @override
  List<Object> get props => [grafiklk!];
}

class GrafikLKLoadingFailed extends GrafikLKState {
  final String? message;

  GrafikLKLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
