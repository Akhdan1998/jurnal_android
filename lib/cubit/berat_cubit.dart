import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_berat.dart';
import '../Models/model_berat.dart';
import '../services/berat_services.dart';
import 'berat_state.dart';

class BeratCubit extends Cubit<BeratState> {
  BeratCubit() : super(BeratInitial());

  Future<void> getBerat(String token, String anak_id) async {
    ApiReturnBerat<List<Berat>>? result =
    await BeratServices.getBerat(token, anak_id);
    if (result?.value != null) {
      emit(BeratLoaded(berat: result?.value));
    } else {
      emit(BeratLoadingFailed(result?.message));
    }
  }
}
