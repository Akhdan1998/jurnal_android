import 'package:equatable/equatable.dart';

import '../Models/model_hasil_berat.dart';

abstract class HasilBeratState extends Equatable {
  @override
  List<Object> get props => [];
}

class HasilBeratInitial extends HasilBeratState {}

class HasilBeratLoaded extends HasilBeratState {
  final SemuaHasilBerat? hasilberat;

  HasilBeratLoaded({this.hasilberat});

  @override
  List<Object> get props => [hasilberat!];
}

class HasilBeratLoadingFailed extends HasilBeratState {
  final String? message;

  HasilBeratLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
