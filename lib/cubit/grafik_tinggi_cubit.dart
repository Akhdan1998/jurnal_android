import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_grafikTinggi.dart';
import '../Models/model_grafikTinggi.dart';
import '../services/grafikTinggi_services.dart';
import 'grafik_tinggi_state.dart';

class GrafikTinggiCubit extends Cubit<GrafikTinggiState> {
  GrafikTinggiCubit() : super(GrafikTinggiInitial());

  Future<void> getGrafikTinggi(String token, String gender) async {
    ApiReturnGrafikTinggi<GrafikTinggiResponse>? result =
        await GrafikTinggiServices.getGrafikTinggi(token, gender);
    if (result?.value != null) {
      emit(GrafikTinggiLoaded(grafiktinggi: result?.value));
    } else {
      emit(GrafikTinggiLoadingFailed(result?.message));
    }
  }
}
