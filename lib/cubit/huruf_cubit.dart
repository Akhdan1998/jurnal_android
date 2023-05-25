import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/api_return_huruf.dart';
import '../Models/model_huruf.dart';
import '../services/huruf_services.dart';
import 'huruf_state.dart';

class HurufCubit extends Cubit<HurufState> {
  HurufCubit() : super(HurufInitial());

  Future<void> getHuruf(String token, String hurufawalan,
      String selectedKelamin, String kategori) async {
    ApiReturnHuruf<List<Huruf>>? result = await HurufServices.getHuruf(
        token, hurufawalan, selectedKelamin, kategori);
    if (result?.value != null) {
      emit(HurufLoaded(abjad: result?.value));
    } else {
      emit(HurufLoadingFailed(result?.message));
    }
  }
}
