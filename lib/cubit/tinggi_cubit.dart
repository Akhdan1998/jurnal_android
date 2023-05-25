import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/cubit/tinggi_state.dart';
import '../Models/api_return_tinggi.dart';
import '../Models/model_tinggi.dart';
import '../services/tinggi_services.dart';

class TinggiCubit extends Cubit<TinggiState> {
  TinggiCubit() : super(TinggiInitial());

  Future<void> getTinggi(String token, String anak_id) async {
    ApiReturnTinggi<List<Tinggi>>? result =
        await TinggiServices.getTinggi(token, anak_id);
    if (result?.value != null) {
      emit(TinggiLoaded(tinggi: result?.value));
    } else {
      emit(TinggiLoadingFailed(result?.message));
    }
  }
}
