import 'package:equatable/equatable.dart';

import '../Models/model_hpl.dart';

abstract class HplState extends Equatable {
  @override
  List<Object> get props => [];
}

class HplInitial extends HplState {}

class HplLoaded extends HplState {
  final Hpl usia;

  HplLoaded({required this.usia});

  @override
  List<Object> get props => [usia];
}

class HplLoadingFailed extends HplState {
  final String? message;

  HplLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
