import 'package:equatable/equatable.dart';

import '../Models/model_huruf.dart';

abstract class HurufState extends Equatable {
  @override
  List<Object> get props => [];
}

class HurufInitial extends HurufState {}

class HurufLoaded extends HurufState {
  final List<Huruf>? abjad;

  HurufLoaded({this.abjad});

  @override
  List<Object> get props => [abjad!];
}

class HurufLoadingFailed extends HurufState {
  final String? message;

  HurufLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
