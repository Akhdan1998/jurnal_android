import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/api_return_milestone.dart';
import '../Models/model_milestone.dart';
import '../services/milestone_services.dart';
import 'milestone_state.dart';

class MilestoneCubit extends Cubit<MilestoneState> {
  MilestoneCubit() : super(MilestoneInitial());

  Future<void> getMilestone(String token) async {
    ApiReturnMilestone<List<Milestones>>? result =
        await MilestoneServices.getMilestone(token);
    if (result?.value != null) {
      emit(MilestonesKatLoaded(milestoned: result?.value));
    } else {
      emit(MilestonesKatLoadingFailed(result?.message));
    }
  }
}
