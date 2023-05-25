import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/cubit/tumbuh_lk_state.dart';
import '../services/tumbuhLk_services.dart';
import '../Models/api_return_tumbuhLk.dart';
import '../Models/model_tumbuhLk.dart';

class TumbuhLkCubit extends Cubit<TumbuhLkState> {
  TumbuhLkCubit() : super(TumbuhLkInitial());

  Future<void> gettumbuhLk(String token, String anak_id) async {
    ApiReturntumbuhLk<List<TumbuhLk>>? result =
        await tumbuhLkServices.gettumbuhLk(token, anak_id);
    if (result?.value != null) {
      emit(TumbuhLkLoaded(tumbuhLk: result?.value));
    } else {
      emit(TumbuhLkLoadingFailed(result?.message));
    }
  }
}
