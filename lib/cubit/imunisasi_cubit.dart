import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/model_imunisasi.dart';
import '../models/api_return_velue.dart';
import '../services/imunisasi_services.dart';

part 'imunisasi_state.dart';

class ImunisasiCubit extends Cubit<ImunisasiState> {
  ImunisasiCubit() : super(ImunisasiInitial());

  Future<void> getImunisasi(String token) async {
    ApiReturnValue<List<ImunisasiGroup>>? result = await ImunisasiServices.getImunisasi(token);
    if (result?.value != null) {
      emit(ImunisasiLoaded(imunisasi: result?.value));
    } else {
      emit(ImunisasiLoadingFailed(result?.message));
    }
  }
}
