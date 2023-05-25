import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/api_return_hpl.dart';
import '../Models/model_hpl.dart';
import '../services/hpl_services.dart';
import 'hpl_state.dart';

class HplCubit extends Cubit<HplState> {
  HplCubit() : super(HplInitial());

  Future<void> getHpl(String token) async {
    ApiReturnHpl<Hpl> result =
    await HplServices.getHpl(token);
    emit(HplLoaded(usia: result.value!));
    // if (result.value != null) {
    //   emit(HplLoaded(usia: result.value!));
    // } else {
    //   emit(HplLoadingFailed(result.message));
    // }
  }
}
