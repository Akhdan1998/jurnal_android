import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/api_return_hasil_lingkar.dart';
import '../Models/model_hasil_lingkar.dart';
import '../services/hasil_lingkar_services.dart';
import 'hasil_lingkar_state.dart';

class HasilLingkarCubit extends Cubit<HasilLingkarState> {
  HasilLingkarCubit() : super(HasilLingkarInitial());

  Future<void> gethasilLingkar(String token, String gender, String anak_id) async {
    ApiReturnHasilLingkar<SemuaHasilLingkar>? result =
    await HasilLingkarServices.getHasilLingkar(token, gender, anak_id);
    if (result?.value != null) {
      emit(HasilLingkarLoaded(hasillingkar: result?.value));
    } else {
      emit(HasilLingkarLoadingFailed(result?.message));
    }
  }
}
