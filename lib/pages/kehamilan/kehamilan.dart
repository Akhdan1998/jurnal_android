part of '../pages.dart';

List<String> list = <String>[
  'Semua',
  'Bunga',
  'Islami',
  'Sansekerta',
  'Galaxy',
  'Wastern',
  'Zodiak'
];

class Kehamilan extends StatefulWidget {
  String token;

  Kehamilan(this.token);

  @override
  State<Kehamilan> createState() => _KehamilanState();
}

class _KehamilanState extends State<Kehamilan> {
  final hurufawalan = TextEditingController();
  String selectedKelamin = 'Laki-laki';
  String dropdownValue = list.first;
  int? show1;
  bool closeName = false;
  void hapus() async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/kehamilan/delete');
    var res = await http.post(
      url_,
      body: {
        //bool
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      bool data = body["data"];
      context
          .read<KehamilanCubit>()
          .getKehamilan('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
      Navigator.of(context).pop(); //showmodel
      Navigator.of(context).pop(); //sheetbutton
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  void initState() {
    super.initState();
    context
        .read<KehamilanCubit>()
        .getKehamilan('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
    context
        .read<TemaCubit>()
        .getTema('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<KehamilanCubit, KehamilanState>(
                builder: (context, snapshot) {
              if (snapshot is BuntingLoaded) {
                if (snapshot.bunting != null) {
                  // var date =
                  // DateTime.fromMillisecondsSinceEpoch(
                  //     snapshot.bunting!
                  //         .hpl!.toInt()! *
                  //         1000);
                  //
                  // String tanggal =
                  // DateFormat('dd MMMM yyyy')
                  //     .format(date);
                  DateTime haha = DateFormat('yyyy-MM-dd hh:mm:ss')
                      .parse(snapshot.bunting!.hpl.toString());

                  String date =
                  DateFormat('dd MMMM yyy').format(haha);
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 260,
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
                                  'Monitoring Kehamilan',
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
                              // padding: EdgeInsets.all(15),
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
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                        top: 15, left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.bunting!.nama_anak ?? '',
                                          style: GoogleFonts.poppins().copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                              color: '323232'.toColor()),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.bunting!.usia
                                                      .toString() ??
                                                  '',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              'Minggu',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              '-',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              'Trimester',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              snapshot.bunting!.trimester
                                                      .toString() ??
                                                  '',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 14),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Minggu',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 11,
                                                      color:
                                                          '323232'.toColor()),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              snapshot.bunting!.usia
                                                      .toString() ??
                                                  '',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 11,
                                                      color:
                                                          '323232'.toColor()),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'HPL :',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 11,
                                                      color:
                                                          '7A7A7A'.toColor()),
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              date,
                                              // snapshot.bunting!.hpl ?? '',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 11,
                                                      color:
                                                          '7A7A7A'.toColor()),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width -
                                          34,
                                      // animation: true,
                                      // animationDuration: 1000,
                                      lineHeight: 15,
                                      percent: snapshot.bunting!.progress!
                                          .toDouble(),
                                      barRadius: Radius.circular(20),
                                      progressColor: 'FF6969'.toColor(),
                                      backgroundColor: 'FFE7E7'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Perkembangan Bayi',
                                      style: GoogleFonts.poppins().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          color: '323232'.toColor()),
                                    ),
                                    Icon(
                                      Icons.info_outlined,
                                      color: 'FF6969'.toColor(),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/rice.png',
                                    scale: 1.5,
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bayi sebesar beras',
                                        style: GoogleFonts.poppins().copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: '5C5C5C'.toColor()),
                                      ),
                                      Text(
                                        snapshot.bunting!.anakProgress
                                                .deskripsi ??
                                            '',
                                        style: GoogleFonts.poppins().copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: '7A7A7A'.toColor()),
                                      ),
                                    ],
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
                  return Column(
                    children: [
                      Stack(
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
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: '888888'.toColor(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Monitoring Kehamilan',
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Untuk memantau pertumbuhan janin, lengkapi data ini terlebih dahulu yuk Moms.',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11,
                                      color: '7A7A7A'.toColor(),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 32,
                                    child: Container(
                                      height: 60,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(inputdatakehamilan());
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                'Buat Data Kehamilan',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Perkembangan Bayi',
                                      style: GoogleFonts.poppins().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          color: '323232'.toColor()),
                                    ),
                                    Icon(
                                      Icons.info_outlined,
                                      color: 'FF6969'.toColor(),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Belum ada data kehamilan',
                                style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: '7A7A7A'.toColor()),
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
            }),
            SizedBox(height: 15),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pencarian Nama',
                            style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: '323232'.toColor()),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hurufawalan.text = '';
                                selectedKelamin = 'Laki-laki';
                                dropdownValue = "Semua";
                                closeName = false;
                              });
                            },
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Text(
                                    'Reset',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.5,
                                        color: 'FF6969'.toColor()),
                                  ),
                                  SizedBox(width: 3),
                                  Icon(
                                    Icons.refresh_outlined,
                                    color: 'FF6969'.toColor(),
                                    size: 17,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<TemaCubit, TemaState>(
                        builder: (context, snapshot) {
                      if (snapshot is TemaLoaded) {
                        if (snapshot.temanama != null) {
                          return DropdownButtonFormField<String>(
                            value: dropdownValue,
                            icon: Icon(
                              Icons.expand_more_outlined,
                              color: 'B8B8B8'.toColor(),
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, top: 5, right: 5),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                    width: 1, color: 'FF6969'.toColor()),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    // color: '989797'.toColor(),
                                  ),
                                ),
                              );
                            }).toList(),
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
                    }),
                    SizedBox(height: 13),
                    TextField(
                      onChanged: (value) {
                        if (value.length > 1) {
                          setState(() {
                            hurufawalan.text = value[0].capitalize!;
                          });
                        }
                      },
                      controller: hurufawalan,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(width: 1, color: 'FF6969'.toColor()),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        hintStyle: GoogleFonts.poppins().copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: '989797'.toColor(),
                        ),
                        hintText: 'Ketik Awalan Huruf',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedKelamin = 'Laki-laki';
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: (selectedKelamin == 'Laki-laki')
                                      ? 'FF6969'.toColor()
                                      : 'E2E2E2'.toColor(),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Laki - laki',
                                style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: '6D6767'.toColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedKelamin = 'Perempuan';
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: (selectedKelamin == 'Perempuan')
                                      ? 'FF6969'.toColor()
                                      : 'E2E2E2'.toColor(),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Perempuan',
                                style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: '6D6767'.toColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedKelamin = 'Unisex';
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: (selectedKelamin == 'Unisex')
                                      ? 'FF6969'.toColor()
                                      : 'E2E2E2'.toColor(),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Unisex',
                                style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: '6D6767'.toColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        context.read<HurufCubit>().getHuruf(
                            'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
                            hurufawalan.text,
                            selectedKelamin ?? "",
                            dropdownValue ?? "");
                        setState(() {
                          closeName = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 11, bottom: 11),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color: 'FF6969'.toColor(),
                          ),
                          color: Colors.white,
                        ),
                        child: Text(
                          'Cari inspirasi nama anak',
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: 'FF6969'.toColor(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            (closeName == false) ? SizedBox() :
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: BlocBuilder<HurufCubit, HurufState>(
                builder: (context, snapshot) {
                  if (snapshot is HurufLoaded) {
                    if (snapshot.abjad != null) {
                      return Container(
                        color: Colors.white,
                        // padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 10,
                                  bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                ),
                                border: Border.all(
                                    color: 'F0F0F0'.toColor(), width: 1),
                                color: 'FF6969'.toColor(),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hasil Pencarian',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Semua Preferensi - Awalan A - Unisex',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                border: Border.all(
                                    color: 'F0F0F0'.toColor(), width: 1),
                              ),
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Column(
                                children: snapshot.abjad!
                                    .mapIndexed(
                                      (int index, e) => Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 5,
                                        bottom: 5),
                                    color: (index.isEven)
                                        ? Colors.white
                                        : 'FFF9F9'.toColor(),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(children: [
                                            Text(
                                              '${index + 1}' + '.',
                                              style: GoogleFonts
                                                  .poppins()
                                                  .copyWith(
                                                  fontWeight:
                                                  FontWeight
                                                      .w300,
                                                  fontSize: 12,
                                                  color: Colors
                                                      .black),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              e.nama ?? '',
                                              style: GoogleFonts
                                                  .poppins()
                                                  .copyWith(
                                                  fontWeight:
                                                  FontWeight
                                                      .w300,
                                                  fontSize: 12,
                                                  color: Colors
                                                      .black),
                                            ),
                                          ]),
                                          GestureDetector(
                                            onTap: () {
                                              if (show1 == e.id) {
                                                setState(() {
                                                  show1 = null;
                                                });
                                              } else {
                                                setState(() {
                                                  show1 = e.id;
                                                });
                                              }
                                            },
                                            child: Container(
                                              color:
                                              Colors.transparent,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Detail',
                                                    style: GoogleFonts
                                                        .poppins()
                                                        .copyWith(
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize:
                                                        12,
                                                        color: 'FF6969'
                                                            .toColor()),
                                                  ),
                                                  SizedBox(width: 5),
                                                  (show1 == e.id)
                                                      ? Icon(
                                                      Icons
                                                          .expand_less_outlined,
                                                      color: 'FF6969'
                                                          .toColor())
                                                      : Icon(
                                                      Icons
                                                          .expand_more_outlined,
                                                      color: 'FF6969'
                                                          .toColor()),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      (show1 == e.id)
                                          ? Text(
                                        e.deskripsi ?? '',
                                        style: GoogleFonts
                                            .poppins()
                                            .copyWith(
                                            fontSize: 11,
                                            color: '414141'
                                                .toColor()),
                                      )
                                          : SizedBox(),
                                    ]),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<KehamilanCubit, KehamilanState>(
          builder: (context, snapshot) {
        if (snapshot is BuntingLoaded) {
          if (snapshot.bunting != null) {
            return FloatingActionButton(
              elevation: 0,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Atur Data Kehamilan',
                              style: GoogleFonts.poppins().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: '323232'.toColor(),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Get.to(editdatakehamilan(snapshot.bunting!));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/editdata.png',
                                        scale: (Platform.isIOS) ? 2 : 3),
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Edit Data Kehamilan',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: '5C5C5C'.toColor(),
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                'Pilih untuk mengubah data kehamilan',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: '7A7A7A'.toColor(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.navigate_next_outlined,
                                            color: 'A6A6A6'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: 'E5E3E3'.toColor()),
                            GestureDetector(
                              onTap: () {
                                Get.to(sukseskecillahir(snapshot.bunting));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/tanda.png', scale: (Platform.isIOS) ? 2 : 3),
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Tandai Si Kecil sudah Lahir',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: '5C5C5C'.toColor(),
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                'Pilih untuk menambah data anak',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: '7A7A7A'.toColor(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.navigate_next_outlined,
                                            color: 'A6A6A6'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: 'E5E3E3'.toColor()),
                            GestureDetector(
                              onTap: () {
                                Get.to(keguguran());
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/laporan.png', scale: (Platform.isIOS) ? 2 : 3),
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Laporkan Keguguran',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: '5C5C5C'.toColor(),
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                'Pilih untuk menghapus data kehamilan Moms',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: '7A7A7A'.toColor(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.navigate_next_outlined,
                                            color: 'A6A6A6'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: 'E5E3E3'.toColor()),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Hapus Data Kehamilan',
                                          style: GoogleFonts.poppins().copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        content: Text(
                                          'Kamu yakin akan menghapus data kehamilan?',
                                          style: GoogleFonts.poppins().copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Tidak',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              hapus();
                                            },
                                            child: Text(
                                              'Ya',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          'FF6969'.toColor()),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/hapus.png', scale: (Platform.isIOS) ? 2 : 3),
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Hapus Data Kehamilan',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: '5C5C5C'.toColor(),
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                'Pilih untuk menghapus status kehamilan',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: '7A7A7A'.toColor(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.navigate_next_outlined,
                                            color: 'A6A6A6'.toColor(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: 'E5E3E3'.toColor()),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: 'FF6969'.toColor(),
              child: Icon(Icons.edit_note_outlined, color: Colors.white),
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
      }),
    );
  }
}
