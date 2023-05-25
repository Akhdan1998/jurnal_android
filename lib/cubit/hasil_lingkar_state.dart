import 'package:equatable/equatable.dart';

import '../Models/model_hasil_lingkar.dart';

abstract class HasilLingkarState extends Equatable {
  @override
  List<Object> get props => [];
}

class HasilLingkarInitial extends HasilLingkarState {}

class HasilLingkarLoaded extends HasilLingkarState {
  final SemuaHasilLingkar? hasillingkar;

  HasilLingkarLoaded({this.hasillingkar});

  @override
  List<Object> get props => [hasillingkar!];
}

class HasilLingkarLoadingFailed extends HasilLingkarState {
  final String? message;

  HasilLingkarLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
