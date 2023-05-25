import 'package:equatable/equatable.dart';

import '../Models/model_milestone.dart';

abstract class KategoriState extends Equatable {
  @override
  List<Object> get props => [];
}

class KategoriInitial extends KategoriState {}

class KategoriLoaded extends KategoriState {
  final List<Milestones>? milestones;

  KategoriLoaded({this.milestones});

  @override
  List<Object> get props => [milestones!];
}

class KategoriLoadingFailed extends KategoriState {
  final String? message;

  KategoriLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
