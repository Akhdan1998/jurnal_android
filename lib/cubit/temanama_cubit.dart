import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/cubit/temanama_state.dart';
import '../Models/api_return_temanama.dart';
import '../services/temanama_services.dart';

class TemaCubit extends Cubit<TemaState> {
  TemaCubit() : super(TemaInitial());

  Future<void> getTema(String token) async {
    ApiReturnTema<List<String>>? result =
    await TemaServices.getTema(token);
    if (result?.value != null) {
      emit(TemaLoaded(temanama: result?.value));
    } else {
      emit(TemaLoadingFailed(result?.message));
    }
  }
}
