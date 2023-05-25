import 'package:equatable/equatable.dart';

import '../Models/model_pertumbuhan.dart';

abstract class TumbuhState extends Equatable {
  @override
  List<Object> get props => [];
}

class TumbuhInitial extends TumbuhState {}

class TumbuhLoaded extends TumbuhState {
  final List<Pertumbuhan>? tumbuh;

  TumbuhLoaded({this.tumbuh});

  @override
  List<Object> get props => [tumbuh!];
}

class TumbuhLoadingFailed extends TumbuhState {
  final String? message;

  TumbuhLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
