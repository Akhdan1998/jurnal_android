part of '../pages.dart';

class beratbadan extends StatefulWidget {
  final String anak_id;
  final String gender;
  final ValueChanged<List<TumbuhBerat>>? listBerat;

  beratbadan(this.anak_id, this.gender, {this.listBerat});

  @override
  State<beratbadan> createState() => _beratbadanState();
}

class _beratbadanState extends State<beratbadan> {
  final tanggalcek2 = TextEditingController();
  final tanggalcek = TextEditingController();
  final berat = TextEditingController();
  String selectedGrafik = '1';

  void deleted(String id) async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/pertumbuhan/delete');
    var res = await http.post(
      url_,
      body: {
        'id': id,
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);

    if (res.statusCode == 200) {
      bool data = body["data"];
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Kamu berhasil menghapus data Berat Badan anak!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: 'FF6969'.toColor(),
          textColor: Colors.white,
          fontSize: 16.0);
      context.read<TumbuhBeratCubit>().gettumbuhBerat(
          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
          widget.anak_id);
      context.read<HasilBeratCubit>().gethasilBerat(
          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
          widget.gender,
          widget.anak_id);
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }
  Future<void> dataBerat(
      String anak_id, String berat, String checked_at) async {
    Uri url = Uri.parse(
        "https://dashboard.parentoday.com/api/jurnal/pertumbuhan/berat/create");
    var res = await http.post(
      url,
      body: {
        "anak_id": anak_id,
        "berat": berat,
        "checked_at": checked_at + ' ' + '07:00:00',
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    print(res.body.toString());
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Kamu berhasil memperbaharui data Berat Badan anak!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: 'FF6969'.toColor(),
          textColor: Colors.white,
          fontSize: 16.0);
      BuatDataAnak data = BuatDataAnak.fromJson(body["data"]);
      print(res.statusCode);
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: 'F0F0F0'.toColor()),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grafik Berat Anak',
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: '323232'.toColor()),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              // clipBehavior: Clip.none,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15), topLeft: Radius.circular(15))),
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    // height: MediaQuery.of(context).size.height,
                                    padding: EdgeInsets.only(
                                        top: 16,
                                        right: 16,
                                        left: 16,
                                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Isi Data Berat',
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: '323232'.toColor(),
                                          ),
                                        ),
                                        SizedBox(height: 14),
                                        Text(
                                          'Tanggal Cek',
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 11,
                                            color: '5A5A5A'.toColor(),
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        TextField(
                                          controller: tanggalcek2,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.date_range,
                                              size: 20,
                                              color: '8F8F8F'.toColor(),
                                            ),
                                            hintStyle: GoogleFonts.poppins().copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: '989797'.toColor(),
                                            ),
                                            hintText: '24 Maret 1998',
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              borderSide:
                                              BorderSide(width: 1, color: 'FF6969'.toColor()),
                                            ),
                                            contentPadding:
                                            EdgeInsets.only(top: 5, left: 10, bottom: 10),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5)),
                                          ),
                                          onTap: () async {
                                            DateTime? pickeddate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1945),
                                                lastDate: DateTime(2500));

                                            if (pickeddate != null) {
                                              setState(() {
                                                tanggalcek2.text =
                                                    DateFormat('yyyy-MM-dd').format(pickeddate);
                                              });
                                            }
                                          },
                                        ),
                                        SizedBox(height: 14),
                                        Text(
                                          'Berat Badan (gram)',
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 11,
                                            color: '5A5A5A'.toColor(),
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          controller: berat,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              borderSide:
                                              BorderSide(width: 1, color: 'FF6969'.toColor()),
                                            ),
                                            contentPadding:
                                            EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                            hintStyle: GoogleFonts.poppins().copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: '989797'.toColor(),
                                            ),
                                            hintText: '10',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 14),
                                        BlocBuilder<BuatdataanakCubit, BuatdataanakState>(
                                          builder: (context, snapshot) {
                                            if (snapshot is BuatdataanakLoaded) {
                                              if (snapshot.dataanak != null) {
                                                return GestureDetector(
                                                  onTap: () async {
                                                    await dataBerat(
                                                        snapshot.dataanak!.first.anak_id.toString(),
                                                        berat.text,
                                                        tanggalcek2.text)
                                                        .whenComplete(() {
                                                      context.read<TumbuhBeratCubit>().gettumbuhBerat(
                                                          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
                                                          snapshot.dataanak!.first.anak_id.toString());
                                                      context.read<HasilBeratCubit>().gethasilBerat(
                                                        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
                                                        snapshot.dataanak!.first.gender.toString(),
                                                        snapshot.dataanak!.first.anak_id.toString(),
                                                      );
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: 'FF6969'.toColor(),
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: Text(
                                                      'Simpan Data',
                                                      style: GoogleFonts.poppins().copyWith(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: 'FFFFFF'.toColor(),
                                                      ),
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
                                        SizedBox(height: 40),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  'Catat Berat',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: 'FF6969'.toColor()),
                                ),
                                Icon(
                                  Icons.add_outlined,
                                  color: 'FF6969'.toColor(),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<HasilBeratCubit, HasilBeratState>(
                      builder: (context, state) {
                    if (state is HasilBeratLoaded) {
                      if (state.hasilberat != null) {
                        return BlocBuilder<GrafikBeratCubit, GrafikBeratState>(
                          builder: (context, snapshot) {
                            if (snapshot is GrafikBeratLoaded) {
                              if (snapshot.grafikberat != null) {
                                return Container(
                                  padding: EdgeInsets.only(right: 16),
                                  child: AspectRatio(
                                    aspectRatio: 15 / 10,
                                    child: LineChart(
                                      LineChartData(
                                        maxX: 350,
                                        minX: 0,
                                        maxY: 150,
                                        minY: 0,
                                        // maxX: 6,
                                        // minX: 0,
                                        // maxY: 15,
                                        // minY: 2,
                                        clipData: FlClipData(
                                            top: true,
                                            bottom: false,
                                            left: false,
                                            right: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          topTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(
                                          show: true,
                                          drawVerticalLine: false,
                                          drawHorizontalLine: true,
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                          border: Border(
                                            top: BorderSide(
                                              style: BorderStyle.solid,
                                              color: 'CFCFCF'.toColor(),
                                            ),
                                          ),
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: snapshot.grafikberat!.tigasd!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: Colors.blue,
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: snapshot.grafikberat!.duasd!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: 'FD7948'.toColor(),
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: snapshot.grafikberat!.satusd!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: '9E401E'.toColor(),
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: snapshot.grafikberat!.median!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: '529166'.toColor(),
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: snapshot
                                                .grafikberat!.mintigasd!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: '9E401E'.toColor(),
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: snapshot
                                                .grafikberat!.minduasd!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: snapshot
                                                .grafikberat!.minsatusd!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: Colors.purpleAccent,
                                            // color: 'FC7847'.toColor(),
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: false),
                                          ),
                                          LineChartBarData(
                                            spots: state.hasilberat!.grafik!
                                                .map((e) => FlSpot(
                                                    e.bulan!.toDouble(),
                                                    e.berat!.toDouble() ?? 0.0))
                                                .toList(),
                                            isCurved: true,
                                            color: Colors.purpleAccent,
                                            // color: 'FC7847'.toColor(),
                                            // color: 'FF6969'.toColor(),
                                            barWidth: 1,
                                            dotData: FlDotData(show: true),
                                          ),
                                        ],
                                      ),
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
                  SizedBox(height: 11),
                  Container(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: '9E401E'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '- 3 SD',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: 'FC7847'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '- 2 SD',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.purpleAccent,
                                      // color: 'FC7847'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '- 1 SD',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: '529166'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Median',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      // color: 'FD7948'.toColor(),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '1 SD',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: 'FD7948'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '2 SD',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: (Platform.isIOS) ? 15 : 12,
                                    height: (Platform.isIOS) ? 15 : 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: '9E401E'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '3 SD',
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: (Platform.isIOS) ? 10 : 9,
                                        fontWeight: FontWeight.bold,
                                        color: '434343'.toColor()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 11),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGrafik = '1';
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: 'FF6969'.toColor(),
                                        ),
                                        color: (selectedGrafik == '1')
                                            ? 'FF6969'.toColor()
                                            : Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 3,
                                          bottom: 3,
                                          left: 23,
                                          right: 23),
                                      child: Text(
                                        'Per Bulan',
                                        style: GoogleFonts.poppins().copyWith(
                                            fontSize: 11,
                                            fontWeight: (selectedGrafik == '1')
                                                ? FontWeight.bold
                                                : FontWeight.w300,
                                            color: (selectedGrafik == '1')
                                                ? Colors.white
                                                : 'FF6969'.toColor()),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGrafik = '2';
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: 'FF6969'.toColor(),
                                        ),
                                        color: (selectedGrafik == '2')
                                            ? 'FF6969'.toColor()
                                            : Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 3,
                                          bottom: 3,
                                          left: 23,
                                          right: 23),
                                      child: Text(
                                        'Per Minggu',
                                        style: GoogleFonts.poppins().copyWith(
                                            fontSize: 11,
                                            fontWeight: (selectedGrafik == '2')
                                                ? FontWeight.bold
                                                : FontWeight.w300,
                                            color: (selectedGrafik == '2')
                                                ? Colors.white
                                                : 'FF6969'.toColor()),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tanggal',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                      color: '7A7A7A'.toColor(),
                                    ),
                                  ),
                                  BlocBuilder<HasilBeratCubit, HasilBeratState>(
                                      builder: (context, state) {
                                    if (state is HasilBeratLoaded) {
                                      if (state.hasilberat != null) {
                                        var date =
                                            DateTime.fromMillisecondsSinceEpoch(
                                                state.hasilberat!.checked_at! *
                                                    1000);
                                        String tanggal =
                                            DateFormat('dd MMMM yyyy')
                                                .format(date);
                                        return Text(
                                          tanggal,
                                          style: GoogleFonts.poppins().copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: (Platform.isIOS) ? 10 : 9,
                                            color: '343434'.toColor(),
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
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(height: 15),
            BlocBuilder<HasilBeratCubit, HasilBeratState>(
                builder: (context, state) {
              if (state is HasilBeratLoaded) {
                if (state.hasilberat != null) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: 'F0F0F0'.toColor()),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasil Pertumbuhan:',
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: '323232'.toColor(),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Berat Badan:',
                              style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                                color: '414141'.toColor(),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              state.hasilberat!.hasil!.berat.toString() +
                                      ' ' +
                                      'kg' ??
                                  '',
                              style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                                color: '414141'.toColor(),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:
                                    state.hasilberat!.hasil!.color!.toColor(),
                              ),
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 11, right: 11),
                              child: Text(
                                state.hasilberat!.hasil!.status.toString() ??
                                    '',
                                style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: state.hasilberat!.hasil!.color_catatan!
                                .toColor(),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Catatan:',
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                state.hasilberat!.hasil!.catatan ?? '',
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
            }),
            SizedBox(height: 15),
            BlocBuilder<TumbuhBeratCubit, TumbuhBeratState>(
              builder: (context, snapshot) {
                if (snapshot is TumbuhBeratLoaded) {
                  if (snapshot.tumbuhBerat != null) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: 'F0F0F0'.toColor()),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Riwayat Pencatatan:',
                                style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: '323232'.toColor(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(riwayatpencatatan(widget.anak_id));
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Text(
                                    'Lihat Semua',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: 'FF6969'.toColor(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 9),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tanggal',
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 11,
                                  color: '414141'.toColor(),
                                ),
                              ),
                              Text(
                                'Berat Badan (kg)',
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 11,
                                  color: '414141'.toColor(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: snapshot.tumbuhBerat!.map((e) {
                              DateTime haha = DateFormat('yyyy-MM-dd hh:mm:ss')
                                  .parse(e.checked_at!);

                              String date =
                                  DateFormat('dd MMMM yyy').format(haha);
                              return Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            date,
                                            style:
                                                GoogleFonts.poppins().copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: '414141'.toColor(),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: (Platform.isIOS) ? 113 : 94,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                e.berat.toString() +
                                                        ' ' +
                                                        'kg' ??
                                                    '',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: '414141'.toColor(),
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            'Hapus data berat anak',
                                                            style: GoogleFonts
                                                                    .poppins()
                                                                .copyWith(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          content: Text(
                                                            'Kamu yakin akan menghapus data berat badan anak?',
                                                            style: GoogleFonts
                                                                    .poppins()
                                                                .copyWith(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                'Tidak',
                                                                style: GoogleFonts.poppins().copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: 'FF6969'
                                                                        .toColor()),
                                                              ),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                deleted(e.id
                                                                    .toString());
                                                              },
                                                              child: Text(
                                                                'Ya',
                                                                style: GoogleFonts.poppins().copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: 'FF6969'
                                                                        .toColor()),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: 'FF6969'.toColor(),
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
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
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<TumbuhBeratCubit>().gettumbuhBerat(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4', widget.anak_id);
    context.read<GrafikBeratCubit>().getGrafikBerat(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4', widget.gender);
    context.read<HasilBeratCubit>().gethasilBerat(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
        widget.gender,
        widget.anak_id);
  }
}
