import 'package:equatable/equatable.dart';

import '../Models/model_tinggi.dart';

abstract class TinggiState extends Equatable {
  @override
  List<Object> get props => [];
}

class TinggiInitial extends TinggiState {}

class TinggiLoaded extends TinggiState {
  final List<Tinggi>? tinggi;

  TinggiLoaded({this.tinggi});

  @override
  List<Object> get props => [tinggi!];
}

class TinggiLoadingFailed extends TinggiState {
  final String? message;

  TinggiLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
