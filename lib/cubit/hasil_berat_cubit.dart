import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_hasil_berat.dart';
import '../Models/model_hasil_berat.dart';
import '../services/hasil_berat_services.dart';
import 'hasil_berat_state.dart';

class HasilBeratCubit extends Cubit<HasilBeratState> {
  HasilBeratCubit() : super(HasilBeratInitial());

  Future<void> gethasilBerat(
      String token, String gender, String anak_id) async {
    ApiReturnHasilBerat<SemuaHasilBerat>? result =
        await HasilBeratServices.getHasilBerat(token, gender, anak_id);
    if (result?.value != null) {
      emit(HasilBeratLoaded(hasilberat: result?.value));
    } else {
      emit(HasilBeratLoadingFailed(result?.message));
    }
  }
}
