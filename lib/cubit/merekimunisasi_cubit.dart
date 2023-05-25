import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../Models/api_return_merek.dart';
import '../Models/model_merek.dart';
import '../services/merek_services.dart';

part 'merekimunisasi_state.dart';

class MerekimunisasiCubit extends Cubit<MerekimunisasiState> {
  MerekimunisasiCubit() : super(MerekimunisasiInitial());

  Future<void> getMerek(String token, String id) async {
    ApiReturnMerek<List<MerekImunisasi>>? result =
        await MerekServices.getMerek(token, id);
    if (result?.value != null) {
      emit(MerekLoaded(merekImun: result?.value));
    } else {
      emit(MerekLoadingFailed(result?.message));
    }
  }
}
