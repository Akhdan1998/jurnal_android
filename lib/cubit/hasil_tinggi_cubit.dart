import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_hasil_tinggi.dart';
import '../Models/model_hasil_tinggi.dart';
import '../services/hasil_tinggi_services.dart';
import 'hasil_tinggi_state.dart';

class HasilTinggiCubit extends Cubit<HasilTinggiState> {
  HasilTinggiCubit() : super(HasilTinggiInitial());

  Future<void> gethasilTinggi(
      String token, String gender, String anak_id) async {
    ApiReturnHasilTinggi<SemuaHasilTinggi>? result =
        await HasilTinggiServices.getHasilTinggi(token, gender, anak_id);
    if (result?.value != null) {
      emit(HasilTinggiLoaded(hasiltinggi: result?.value));
    } else {
      emit(HasilTinggiLoadingFailed(result?.message));
    }
  }
}
