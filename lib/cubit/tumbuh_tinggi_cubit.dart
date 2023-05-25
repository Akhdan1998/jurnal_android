import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/cubit/tumbuh_tinggi_state.dart';
import '../services/tumbuhTinggi_services.dart';

import '../Models/api_return_tumbuhtinggi.dart';
import '../Models/model_tumbuhTinggi.dart';

class TumbuhTinggiCubit extends Cubit<TumbuhTinggiState> {
  TumbuhTinggiCubit() : super(TumbuhTinggiInitial());

  Future<void> gettumbuhTinggi(String token, String anak_id) async {
    ApiReturntumbuhTinggi<List<TumbuhTinggi>>? result =
        await tumbuhTinggiServices.gettumbuhTinggi(token, anak_id);
    if (result?.value != null) {
      emit(TumbuhTinggiLoaded(tumbuhtinggi: result?.value));
    } else {
      emit(TumbuhTinggiLoadingFailed(result?.message));
    }
  }
}
