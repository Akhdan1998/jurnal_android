import 'package:equatable/equatable.dart';

import '../Models/model_tumbuhLk.dart';

abstract class TumbuhLkState extends Equatable {
  @override
  List<Object> get props => [];
}

class TumbuhLkInitial extends TumbuhLkState {}

class TumbuhLkLoaded extends TumbuhLkState {
  final List<TumbuhLk>? tumbuhLk;

  TumbuhLkLoaded({this.tumbuhLk});

  @override
  List<Object> get props => [tumbuhLk!];
}

class TumbuhLkLoadingFailed extends TumbuhLkState {
  final String? message;

  TumbuhLkLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
