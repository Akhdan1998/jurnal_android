part of '../pages.dart';

class imunisasi extends StatefulWidget {
  String token;

  imunisasi(this.token);

  @override
  State<imunisasi> createState() => _imunisasiState();
}

class _imunisasiState extends State<imunisasi> {
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;
  String selectedButton = '1';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ImunisasiCubit>().getImunisasi('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
    context.read<BuatdataanakCubit>().getBuatDataAnak('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ImunisasiCubit, ImunisasiState>(
        builder: (context, snapshot) {
          if (snapshot is ImunisasiLoaded) {
            if (snapshot.imunisasi != null) {
              return SingleChildScrollView(
                clipBehavior: Clip.hardEdge,
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.white,
                  child: Column(
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
                                    height: 225,
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
                                            child: Icon(Icons.arrow_back, color: '888888'.toColor(),),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          'Imunisasi',
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
                                    top: 150,
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
                                      child: Row(children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          child: Image.asset((snapshot.dataanak!
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.dataanak!
                                                            .firstWhere((e) =>
                                                                e.is_active ==
                                                                1)
                                                            .name ??
                                                        '',
                                                    style: GoogleFonts.poppins()
                                                        .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: '323232'
                                                                .toColor()),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        snapshot.dataanak!
                                                                .firstWhere((e) =>
                                                                    e.is_active ==
                                                                    1)
                                                                .gender ??
                                                            '',
                                                        style: GoogleFonts
                                                                .poppins()
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w300,
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
                                                              FontWeight.w300,
                                                          fontSize: 11,
                                                          color: '7A7A7A'
                                                              .toColor(),
                                                        ),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Text(
                                                        snapshot.dataanak!.first
                                                            .umur_tahun
                                                            .toString() +
                                                            ' ' +
                                                            'Tahun' ??
                                                            '',
                                                        style: GoogleFonts.poppins()
                                                            .copyWith(
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 11,
                                                          color: '7A7A7A'.toColor(),
                                                        ),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Text(
                                                        snapshot.dataanak!.first
                                                            .umur_bulan
                                                            .toString() +
                                                            ' ' +
                                                            'Bulan' ??
                                                            '',
                                                        style: GoogleFonts.poppins()
                                                            .copyWith(
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 11,
                                                          color: '7A7A7A'.toColor(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    backgroundColor: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(15),
                                                                topLeft: Radius.circular(15),
                                                            ),
                                                    ),
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return bottomsheetImunisasi(snapshot.dataanak!);
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Ganti Anak',
                                                      style:
                                                          GoogleFonts.poppins()
                                                              .copyWith(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 10,
                                                        color:
                                                            'FF6969'.toColor(),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5),
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color: 'FF6969'.toColor(),
                                                      size: 18,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
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
                                    height: 265,
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
                                            child: Icon(Icons.arrow_back, color: '888888'.toColor(),),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          'Imunisasi',
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
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: '323232'.toColor(),
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'Untuk memantau jadwal dan pilihan imunisasi anak, isi terlebih dahulu data anak ya Moms.',
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11,
                                              color: '7A7A7A'.toColor(),
                                            ),
                                          ),
                                          SizedBox(height: 11),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 32,
                                            child: Container(
                                              height: 60,
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
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Buat Data Anak',
                                                        style: GoogleFonts
                                                                .poppins()
                                                            .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: 'FFFFFF'
                                                              .toColor(),
                                                        ),
                                                      ),
                                                      SizedBox(width: 3),
                                                      Icon(
                                                        Icons.add_outlined,
                                                        color:
                                                            'FFFFFF'.toColor(),
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
                      SizedBox(height: 5),
                      SingleChildScrollView(
                        clipBehavior: Clip.hardEdge,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedButton = '1';
                                });
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.bounceInOut);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: (selectedButton == '1')
                                        ? Colors.white
                                        : 'F0F0F0'.toColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: (selectedButton == '1')
                                      ? 'FF6969'.toColor()
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                child: Text(
                                  'Semua',
                                  style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: (selectedButton == '1')
                                        ? Colors.white
                                        : '989797'.toColor(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedButton = '2';
                                });
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.bounceInOut);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: (selectedButton == '2')
                                        ? Colors.white
                                        : 'F0F0F0'.toColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: (selectedButton == '2')
                                      ? 'FF6969'.toColor()
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                child: Text(
                                  'Sudah Imunisasi',
                                  style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: (selectedButton == '2')
                                        ? Colors.white
                                        : '989797'.toColor(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedButton = '3';
                                });
                                pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.bounceInOut);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: (selectedButton == '3')
                                        ? Colors.white
                                        : 'F0F0F0'.toColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: (selectedButton == '3')
                                      ? 'FF6969'.toColor()
                                      : Colors.white,
                                ),
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 8),
                                child: Text(
                                  'Belum Imunisasi',
                                  style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: (selectedButton == '3')
                                        ? Colors.white
                                        : '989797'.toColor(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // color: Colors.green,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        width: MediaQuery.of(context).size.width,
                        height: 76 * snapshot.imunisasi!.length.toDouble(),
                        child: PageView(
                          // physics: NeverScrollableScrollPhysics(),
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              pageChanged = index;
                            });
                            print(pageChanged);
                          },
                          children: [
                            semua(snapshot.imunisasi),
                            sudahimunisasi(snapshot.imunisasi),
                            belumimunisasi(snapshot.imunisasi),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
        },
      ),
    );
  }
}
