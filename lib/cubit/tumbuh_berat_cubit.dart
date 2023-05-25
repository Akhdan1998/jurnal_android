import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/cubit/tumbuh_berat_state.dart';
import '../Models/api_return_tumbuhberat.dart';
import '../Models/model_tumbuhBerat.dart';
import '../services/tumbuhBerat_services.dart';

class TumbuhBeratCubit extends Cubit<TumbuhBeratState> {
  TumbuhBeratCubit() : super(TumbuhBeratInitial());

  Future<void> gettumbuhBerat(String token, String anak_id) async {
    ApiReturntumbuhBerat<List<TumbuhBerat>>? result =
        await tumbuhBeratServices.gettumbuhBerat(token, anak_id);
    if (result?.value != null) {
      emit(TumbuhBeratLoaded(tumbuhBerat: result?.value));
    } else {
      emit(TumbuhBeratLoadingFailed(result?.message));
    }
  }
}
