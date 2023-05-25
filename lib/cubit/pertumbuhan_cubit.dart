import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/Models/model_pertumbuhan.dart';
import 'package:jurnal_android/cubit/pertumbuhan_state.dart';
import '../Models/api_return_tumbuh.dart';
import '../services/tumbuh_services.dart';

class TumbuhCubit extends Cubit<TumbuhState> {
  TumbuhCubit() : super(TumbuhInitial());

  Future<void> getTumbuh(String token) async {
    ApiReturnTumbuh<List<Pertumbuhan>>? result =
        await TumbuhServices.getTumbuh(token);
    if (result?.value != null) {
      emit(TumbuhLoaded(tumbuh: result?.value));
    } else {
      emit(TumbuhLoadingFailed(result?.message));
    }
  }
}
