part of '../pages.dart';

class editdatakehamilan extends StatefulWidget {
  Kelahiran ubahdata;

  editdatakehamilan(this.ubahdata);

  @override
  State<editdatakehamilan> createState() => _editdatakehamilanState();
}

class _editdatakehamilanState extends State<editdatakehamilan> {
  final nama = TextEditingController();
  bool value = true;
  final HPHT = TextEditingController();
  bool show = false;
  bool isLoading = false;

  void edit(String _nama, String _hpht) async {
    Uri url = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/kehamilan/update');
    var response = await http.post(
      url,
      body: {
        'nama_anak': _nama,
        'hpht': _hpht,
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    print(response.body.toString());
    Map<String, dynamic> body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Kamu berhasil memperbaharui data kehamilan!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: 'FF6969'.toColor(),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Kelahiran data = Kelahiran.fromJson(body['data']);
      print(response.body.toString());
      print(response);
      Get.off(navigation(
        "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
        index: 3,
      ));
    } else {
      throw 'Error ${response.statusCode} => ${body['meta']['message']}';
    }
  }

  @override
  void initState() {
    super.initState();
    nama.text = widget.ubahdata.nama_anak ?? '';
    HPHT.text = widget.ubahdata.hpht ?? '';
    context
        .read<HplCubit>()
        .getHpl('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: 'FF6969'.toColor(),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: 'FFFFFF'.toColor(),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Sunting Data Kehamilan',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: 'FFFFFF'.toColor(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    // color: Colors.yellow,
                    height: (Platform.isIOS) ? 16 : 16,
                    width: (Platform.isIOS) ? 40 : 40,
                    padding: EdgeInsets.zero,
                    child: Switch.adaptive(
                      activeColor:
                          (Platform.isIOS) ? 'FF6969'.toColor() : Colors.white,
                      activeTrackColor:
                          (Platform.isIOS) ? Colors.green : '86C3BB'.toColor(),
                      value: value,
                      onChanged: (value) => setState(() {
                        this.value = value;
                        show = !show;
                      }),
                    ),
                  ),
                  SizedBox(width: (Platform.isIOS) ? 15 : 5),
                  Text(
                    'Nama Calon Bayi',
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: '5A5A5A'.toColor()),
                  )
                ],
              ),
              SizedBox(height: 15),
              (show == true)
                  ? SizedBox()
                  : TextField(
                      controller: nama,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(width: 1, color: 'FF6969'.toColor()),
                        ),
                        suffixIcon: Container(
                          width: 106,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Cari nama disini',
                                style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: 'FF6969'.toColor()),
                              ),
                              Icon(
                                Icons.chevron_right_outlined,
                                color: 'FF6969'.toColor(),
                              ),
                            ],
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        hintStyle: GoogleFonts.poppins().copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: '989797'.toColor(),
                        ),
                        hintText: 'Preferensi Nama',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
              SizedBox(height: 20),
              Text(
                'Hari Pertama Haid Terakhir (HPHT)',
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: '5A5A5A'.toColor()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: HPHT,
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
                  hintText: '24 Maret 2023',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  contentPadding: EdgeInsets.only(top: 5, left: 10, bottom: 10),
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
                    HplServices();
                    setState(() {
                      HPHT.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              BlocBuilder<HplCubit, HplState>(builder: (context, snapshot) {
                if (snapshot is HplLoaded) {
                  if (snapshot.usia != null) {
                    return Container(
                      decoration: BoxDecoration(
                        color: 'F2F2F2'.toColor(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hasil Data :',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: '363636'.toColor()),
                          ),
                          SizedBox(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hari Perkiraan Lahir (HPL) :',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: '373737'.toColor()),
                              ),
                              Text(
                                snapshot.usia.hpl ?? '',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: '393939'.toColor()),
                              ),
                            ],
                          ),
                          SizedBox(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Usia Kehamilan :',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: '373737'.toColor()),
                              ),
                              Text(
                                snapshot.usia.usia ?? '',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: '393939'.toColor()),
                              ),
                            ],
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: (Platform.isIOS) ? 80 : 60,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: GestureDetector(
          onTap: () {
            edit(nama.text, HPHT.text);
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: 'FF6969'.toColor(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: isLoading
                ? Container(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    ),
                  )
                : Text(
                    'Simpan Data',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: 'FFFFFF'.toColor(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
