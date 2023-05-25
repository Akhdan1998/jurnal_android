import 'package:equatable/equatable.dart';

import '../Models/model_hasil_tinggi.dart';

abstract class HasilTinggiState extends Equatable {
  @override
  List<Object> get props => [];
}

class HasilTinggiInitial extends HasilTinggiState {}

class HasilTinggiLoaded extends HasilTinggiState {
  final SemuaHasilTinggi? hasiltinggi;

  HasilTinggiLoaded({this.hasiltinggi});

  @override
  List<Object> get props => [hasiltinggi!];
}

class HasilTinggiLoadingFailed extends HasilTinggiState {
  final String? message;

  HasilTinggiLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
