import 'package:equatable/equatable.dart';

import '../Models/model_lk.dart';

abstract class LkState extends Equatable {
  @override
  List<Object> get props => [];
}

class LkInitial extends LkState {}

class LkLoaded extends LkState {
  final List<Lk>? lk;

  LkLoaded({this.lk});

  @override
  List<Object> get props => [lk!];
}

class LkLoadingFailed extends LkState {
  final String? message;

  LkLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
