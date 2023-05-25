import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jurnal_android/Models/model_buatdataanak.dart';

import '../Models/api_return_buatdataanak.dart';
import '../services/buatdataanak_services.dart';

part 'buatdataanak_state.dart';

class BuatdataanakCubit extends Cubit<BuatdataanakState> {
  BuatdataanakCubit() : super(BuatdataanakInitial());

  Future<void> getBuatDataAnak(String token) async {
    ApiReturnBuatAnak<List<BuatDataAnak>>? result =
    await BuatDataServices.getData(token);
    if (result?.value != null) {
      emit(BuatdataanakLoaded(dataanak: result?.value));
    } else {
      emit(BuatdataanakLoadingFailed(result?.message));
    }
  }
}
