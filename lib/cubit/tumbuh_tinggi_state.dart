import 'package:equatable/equatable.dart';

import '../Models/model_tumbuhTinggi.dart';

abstract class TumbuhTinggiState extends Equatable {
  @override
  List<Object> get props => [];
}

class TumbuhTinggiInitial extends TumbuhTinggiState {}

class TumbuhTinggiLoaded extends TumbuhTinggiState {
  final List<TumbuhTinggi>? tumbuhtinggi;

  TumbuhTinggiLoaded({this.tumbuhtinggi});

  @override
  List<Object> get props => [tumbuhtinggi!];
}

class TumbuhTinggiLoadingFailed extends TumbuhTinggiState {
  final String? message;

  TumbuhTinggiLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
