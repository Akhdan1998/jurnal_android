import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurnal_android/pages/pages.dart';
import 'cubit/_milestone_kategori_cubit.dart';
import 'cubit/berat_cubit.dart';
import 'cubit/buatdataanak_cubit.dart';
import 'cubit/grafik_berat_cubit.dart';
import 'cubit/grafik_lingkarkepala_cubit.dart';
import 'cubit/grafik_tinggi_cubit.dart';
import 'cubit/hasil_berat_cubit.dart';
import 'cubit/hasil_lingkar_cubit.dart';
import 'cubit/hasil_tinggi_cubit.dart';
import 'cubit/hpl_cubit.dart';
import 'cubit/huruf_cubit.dart';
import 'cubit/imunisasi_cubit.dart';
import 'cubit/kehamilan_cubit.dart';
import 'cubit/lk_cubit.dart';
import 'cubit/merekimunisasi_cubit.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'cubit/milestone_cubit.dart';
import 'cubit/temanama_cubit.dart';
import 'cubit/tinggi_cubit.dart';
import 'cubit/tumbuh_berat_cubit.dart';
import 'cubit/tumbuh_lk_cubit.dart';
import 'cubit/tumbuh_tinggi_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ImunisasiCubit()),
        BlocProvider(create: (_) => MerekimunisasiCubit()),
        BlocProvider(create: (_) => BuatdataanakCubit()),
        BlocProvider(create: (_) => MilestoneCubit()),
        BlocProvider(create: (_) => KategoriCubit()),
        BlocProvider(create: (_) => KehamilanCubit()),
        BlocProvider(create: (_) => HplCubit()),
        BlocProvider(create: (_) => TemaCubit()),
        BlocProvider(create: (_) => HurufCubit()),
        BlocProvider(create: (_) => TumbuhTinggiCubit()),
        BlocProvider(create: (_) => TumbuhBeratCubit()),
        BlocProvider(create: (_) => TumbuhLkCubit()),
        BlocProvider(create: (_) => TinggiCubit()),
        BlocProvider(create: (_) => BeratCubit()),
        BlocProvider(create: (_) => LkCubit()),
        BlocProvider(create: (_) => GrafikTinggiCubit()),
        BlocProvider(create: (_) => GrafikBeratCubit()),
        BlocProvider(create: (_) => GrafikLKCubit()),
        BlocProvider(create: (_) => HasilTinggiCubit()),
        BlocProvider(create: (_) => HasilBeratCubit()),
        BlocProvider(create: (_) => HasilLingkarCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            navigation('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4'),
      ),
    );
  }
}
