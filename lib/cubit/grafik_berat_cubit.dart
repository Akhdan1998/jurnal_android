import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_grafikBerat.dart';
import '../Models/model_grafikBerat.dart';
import '../services/grafikBerat_services.dart';
import 'grafik_berat_state.dart';

class GrafikBeratCubit extends Cubit<GrafikBeratState> {
  GrafikBeratCubit() : super(GrafikBeratInitial());

  Future<void> getGrafikBerat(String token, String gender) async {
    ApiReturnGrafikBerat<GrafikBeratResponse>? result =
        await GrafikBeratServices.getGrafikBerat(token, gender);
    if (result?.value != null) {
      emit(GrafikBeratLoaded(grafikberat: result?.value));
    } else {
      emit(GrafikBeratLoadingFailed(result?.message));
    }
  }
}
