import 'package:equatable/equatable.dart';

import '../Models/model_grafikTinggi.dart';

abstract class GrafikTinggiState extends Equatable {
  @override
  List<Object> get props => [];
}

class GrafikTinggiInitial extends GrafikTinggiState {}

class GrafikTinggiLoaded extends GrafikTinggiState {
  final GrafikTinggiResponse? grafiktinggi;

  GrafikTinggiLoaded({this.grafiktinggi});

  @override
  List<Object> get props => [grafiktinggi!];
}

class GrafikTinggiLoadingFailed extends GrafikTinggiState {
  final String? message;

  GrafikTinggiLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
