import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/api_return_kehamilan.dart';
import '../Models/model_kehamilan.dart';
import '../services/kehamilan_services.dart';
import 'kehamilan_state.dart';

class KehamilanCubit extends Cubit<KehamilanState> {
  KehamilanCubit() : super(KehamilanInitial());

  Future<void> getKehamilan(String token) async {
    ApiReturnKehamilan<Kelahiran> result =
        await KehamilanServices.dataGet(token);
    emit(BuntingLoaded(bunting: result.value));
    // if (result.value != null) {
    //   emit(BuntingLoaded(bunting: result.value!));
    // } else {
    //   emit(BuntingLoadingFailed(result.message));
    // }
  }
}
