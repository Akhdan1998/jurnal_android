import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_grafikLK.dart';
import '../Models/model_grafikLK.dart';
import '../services/grafikLK_services.dart';
import 'grafik_lingkarkepala_state.dart';

class GrafikLKCubit extends Cubit<GrafikLKState> {
  GrafikLKCubit() : super(GrafikLKInitial());

  Future<void> getGrafikLK(String token, String gender) async {
    ApiReturnGrafikLK<GrafikLKResponse>? result =
    await GrafikLKServices.getGrafikLK(token, gender);
    if (result?.value != null) {
      emit(GrafikLKLoaded(grafiklk: result?.value));
    } else {
      emit(GrafikLKLoadingFailed(result?.message));
    }
  }
}
