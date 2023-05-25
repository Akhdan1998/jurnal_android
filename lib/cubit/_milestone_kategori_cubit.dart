import '../Models/api_return_milestone_kategori.dart';
import '../Models/model_milestone.dart';
import '../services/milestone_kategori_services.dart';
import '_milestone_kategori_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KategoriCubit extends Cubit<KategoriState> {
  KategoriCubit() : super(KategoriInitial());

  Future<void> getMilestonesKat(String token) async {
    ApiReturnKategori<List<Milestones>>? result =
        await KategoriServices.getKategori(token);
    if (result?.value != null) {
      emit(KategoriLoaded(milestones: result?.value));
    } else {
      emit(KategoriLoadingFailed(result?.message));
    }
  }
}
