import '../Models/model_milestone.dart';
import 'package:equatable/equatable.dart';

abstract class MilestoneState extends Equatable {
  @override
  List<Object> get props => [];
}

class MilestoneInitial extends MilestoneState {}

class MilestonesKatLoaded extends MilestoneState {
  final List<Milestones>? milestoned;

  MilestonesKatLoaded({this.milestoned});

  @override
  List<Object> get props => [milestoned!];
}

class MilestonesKatLoadingFailed extends MilestoneState {
  final String? message;

  MilestonesKatLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
