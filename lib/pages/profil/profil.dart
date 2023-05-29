part of '../pages.dart';

class Profil extends StatefulWidget {
  String token;

  Profil(this.token);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BuatdataanakCubit>().getBuatDataAnak(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: BlocBuilder<BuatdataanakCubit, BuatdataanakState>(
            builder: (context, snapshot) {
          if (snapshot is BuatdataanakLoaded) {
            if (snapshot.dataanak != null) {
              return Column(
                children: [
                  BlocBuilder<BuatdataanakCubit, BuatdataanakState>(
                    builder: (context, snapshot) {
                      if (snapshot is BuatdataanakLoaded) {
                        if (snapshot.dataanak != null &&
                            snapshot.dataanak!.isNotEmpty) {
                          return Stack(
                            children: [
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                height: 310,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                color: 'D9D9D9'.toColor(),
                                width: MediaQuery.of(context).size.width,
                                height: 235,
                                padding: EdgeInsets.only(left: 16, top: 43),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: '888888'.toColor(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Jurnal Untuk Parent',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: '747474'.toColor(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 16,
                                right: 16,
                                top: 165,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: 'F0F0F0'.toColor(),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  // height: 131,
                                  child: Column(
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Image.asset((snapshot
                                                          .dataanak!
                                                          .firstWhere((e) =>
                                                              e.is_active == 1)
                                                          .gender ==
                                                      'Laki-laki')
                                                  ? 'assets/laki.png'
                                                  : 'assets/cwe.png'),
                                            ),
                                            SizedBox(width: 9),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  113,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.dataanak!
                                                                .firstWhere((e) =>
                                                                    e.is_active ==
                                                                    1)
                                                                .name ??
                                                            '',
                                                        style: GoogleFonts
                                                                .poppins()
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: '323232'
                                                                    .toColor()),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            snapshot.dataanak!
                                                                    .firstWhere(
                                                                        (e) =>
                                                                            e.is_active ==
                                                                            1)
                                                                    .gender ??
                                                                '',
                                                            style: GoogleFonts
                                                                    .poppins()
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 11,
                                                              color: '7A7A7A'
                                                                  .toColor(),
                                                            ),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Text(
                                                            '|',
                                                            style: GoogleFonts
                                                                    .poppins()
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 11,
                                                              color: '7A7A7A'
                                                                  .toColor(),
                                                            ),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Text(
                                                            snapshot.dataanak!.first.umur_tahun.toString() + ' ' + 'Tahun' ?? '',
                                                            style: GoogleFonts
                                                                    .poppins()
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 11,
                                                              color: '7A7A7A'
                                                                  .toColor(),
                                                            ),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Text(
                                                            snapshot.dataanak!.first.umur_bulan.toString() + ' ' + 'Bulan' ?? '',
                                                            style: GoogleFonts
                                                                    .poppins()
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 11,
                                                              color: '7A7A7A'
                                                                  .toColor(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15))),
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return bottomsheetImunisasi(
                                                              snapshot
                                                                  .dataanak!);
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Ganti Anak',
                                                            style: GoogleFonts
                                                                .poppins()
                                                                .copyWith(
                                                              fontWeight:
                                                              FontWeight.w300,
                                                              fontSize: 10,
                                                              color: 'FF6969'
                                                                  .toColor(),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_down_outlined,
                                                            color: 'FF6969'
                                                                .toColor(),
                                                            size: 18,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: 'F0F0F0'.toColor(),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            padding: (Platform.isIOS)
                                                ? EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 15,
                                                    right: 15)
                                                : EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 10,
                                                    right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Berat Badan',
                                                  style: GoogleFonts.poppins()
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: '323232'.toColor(),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  (snapshot.dataanak!.first.pertumbuhan == null && snapshot.dataanak!.first.pertumbuhan!.first.berat == null)
                                                      ? '-'
                                                      : snapshot.dataanak!.first.pertumbuhan!.isNotEmpty
                                                          ? (snapshot.dataanak!.first.pertumbuhan!.first.berat.toString() + ' ' + 'kg' ?? '')
                                                          : (snapshot.dataanak!.first.pertumbuhan!.isNotEmpty)
                                                      ? (snapshot.dataanak!.first.pertumbuhan!.first.berat.toString() + ' ' + 'kg' ?? '')
                                                      : '-',
                                                  style: GoogleFonts.poppins().copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: 'FF6969'.toColor(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: 'F0F0F0'.toColor(),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            padding: (Platform.isIOS) ? EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 15,
                                                    right: 15) : EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 10,
                                                    right: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Tinggi Badan',
                                                  style: GoogleFonts.poppins()
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: '323232'.toColor(),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  (snapshot.dataanak!.first.pertumbuhan == null && snapshot.dataanak!.first.pertumbuhan!.first.tinggi == null)
                                                      ? '-'
                                                      : snapshot.dataanak!.first.pertumbuhan!.isNotEmpty
                                                          ? (snapshot.dataanak!.first.pertumbuhan!.first.tinggi.toString() + ' ' + 'cm' ?? '')
                                                          : (snapshot.dataanak!.first.pertumbuhan!.isNotEmpty)
                                                      ? (snapshot.dataanak!.first.pertumbuhan!.first.tinggi.toString() + ' ' + 'cm' ?? '')
                                                      : '-',
                                                  style: GoogleFonts.poppins().copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: '86C3BB'.toColor(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: 'F0F0F0'.toColor(),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                            ),
                                            padding: (Platform.isIOS) ? EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 15,
                                                    right: 15) : EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 10,
                                                    right: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Lingkar Kepala',
                                                  style: GoogleFonts.poppins()
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: '323232'.toColor(),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  (snapshot.dataanak!.first.pertumbuhan == null && snapshot.dataanak!.first.pertumbuhan!.first.lingkar_kepala == null)
                                                      ? '-'
                                                      : snapshot.dataanak!.first.pertumbuhan!.isNotEmpty
                                                          ? (snapshot.dataanak!.first.pertumbuhan!.first.lingkar_kepala.toString() + ' ' + 'cm' ?? '')
                                                          : (snapshot.dataanak!.first.pertumbuhan!.isNotEmpty)
                                                      ? (snapshot.dataanak!.first.pertumbuhan!.first.lingkar_kepala.toString() + ' ' + 'cm' ?? '')
                                                      : '-',
                                                  style: GoogleFonts.poppins()
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: 'D1B654'.toColor(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Stack(
                            children: [
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                height: 274,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                color: 'D9D9D9'.toColor(),
                                width: MediaQuery.of(context).size.width,
                                height: 187,
                                padding: EdgeInsets.only(left: 16, top: 43),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: '888888'.toColor(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Jurnal Untuk Parent',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: '747474'.toColor(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 16,
                                right: 16,
                                top: 135,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: 'F0F0F0'.toColor(),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  // height: 131,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hi Bunda, Selamat Datang!!',
                                        style: GoogleFonts.poppins().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: '323232'.toColor(),
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Untuk memantau jadwal dan pilihan imunisasi anak, isi terlebih dahulu data anak ya Moms.',
                                        style: GoogleFonts.poppins().copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11,
                                          color: '7A7A7A'.toColor(),
                                        ),
                                      ),
                                      SizedBox(height: 11),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // height: 32,
                                        child: Container(
                                          // height: 60,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(dataanak());
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: 'FF6969'.toColor(),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Buat Data Anak',
                                                    style: GoogleFonts.poppins()
                                                        .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: 'FFFFFF'.toColor(),
                                                    ),
                                                  ),
                                                  SizedBox(width: 3),
                                                  Icon(
                                                    Icons.add_outlined,
                                                    color: 'FFFFFF'.toColor(),
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: 'FF6969'.toColor(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: 'F0F0F0'.toColor(),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data Awal Kelahiran:',
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: '323232'.toColor(),
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: 'F0F0F0'.toColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                padding: (Platform.isIOS) ? EdgeInsets.only(
                                        top: 5, bottom: 5, left: 15, right: 15) : EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Berat Badan',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: '323232'.toColor(),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      (snapshot.dataanak!.first.berat_lahir == null)
                                          ? '-'
                                          : snapshot.dataanak!.first.berat_lahir
                                                      .toString() +
                                                  ' ' +
                                                  'kg' ??
                                              '',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: 'FF6969'.toColor(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: 'F0F0F0'.toColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                padding: (Platform.isIOS)
                                    ? EdgeInsets.only(
                                        top: 5, bottom: 5, left: 15, right: 15)
                                    : EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Tinggi Badan',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: '323232'.toColor(),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      (snapshot.dataanak!.first.tinggi_lahir ==
                                              null)
                                          ? '-'
                                          : snapshot.dataanak!.first
                                                      .tinggi_lahir
                                                      .toString() +
                                                  ' ' +
                                                  'cm' ??
                                              '',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: '86C3BB'.toColor(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: 'F0F0F0'.toColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                padding: (Platform.isIOS)
                                    ? EdgeInsets.only(
                                        top: 5, bottom: 5, left: 15, right: 15)
                                    : EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lingkar Kepala',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: '323232'.toColor(),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      (snapshot.dataanak!.first
                                                  .lingkar_kepala_lahir ==
                                              null)
                                          ? '-'
                                          : snapshot.dataanak!.first
                                                      .lingkar_kepala_lahir
                                                      .toString() +
                                                  ' ' +
                                                  'cm' ??
                                              '',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: 'D1B654'.toColor(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<BuatdataanakCubit, BuatdataanakState>(
                    builder: (context, snapshot) {
                      if (snapshot is BuatdataanakLoaded) {
                        if (snapshot.dataanak != null &&
                            snapshot.dataanak!.isNotEmpty) {
                          return Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: 'F0F0F0'.toColor(),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              // height: 131,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pengaturan:',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: '323232'.toColor(),
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ubahdataanak(snapshot.dataanak!
                                          .firstWhere(
                                              (e) => e.is_active == 1)));
                                    },
                                    child: Container(
                                      padding: (Platform.isIOS) ? EdgeInsets.only(top: 8, bottom: 8) : EdgeInsets.only(top: 1, bottom: 1),
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ubah Profil Anak',
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: '424242'.toColor(),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_outlined,
                                            color: '424242'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(color: 'E5E3E3'.toColor()),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ubahdatadetailanak(
                                          snapshot.dataanak!.firstWhere(
                                              (e) => e.is_active == 1)));
                                    },
                                    child: Container(
                                      padding: (Platform.isIOS) ? EdgeInsets.only(top: 8, bottom: 8) : EdgeInsets.only(top: 1, bottom: 1),
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lengkapi Data Anak',
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: '424242'.toColor(),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_outlined,
                                            color: '424242'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(color: 'E5E3E3'.toColor()),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ubahdatakelahirananak(
                                          snapshot.dataanak!.firstWhere(
                                              (e) => e.is_active == 1)));
                                    },
                                    child: Container(
                                      padding: (Platform.isIOS) ? EdgeInsets.only(top: 8, bottom: 8) : EdgeInsets.only(top: 1, bottom: 1),
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lengkapi Data Kelahiran Anak',
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              color: '424242'.toColor(),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right_outlined,
                                            color: '424242'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: 'FF6969'.toColor(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              );
            } else {
              return const Center(
                child: SizedBox(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: 'FF6969'.toColor(),
              ),
            );
          }
        }),
      ),
    );
  }
}
