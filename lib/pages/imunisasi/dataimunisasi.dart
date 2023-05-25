part of '../pages.dart';

class isidataimunisasi extends StatefulWidget {
  late final ImunisasiGroup? imunisasi;

  isidataimunisasi(this.imunisasi);

  @override
  State<isidataimunisasi> createState() => _isidataimunisasiState();
}

class _isidataimunisasiState extends State<isidataimunisasi> {
  final tanggalcek = TextEditingController();
  final namaimunisasi = TextEditingController();
  final lokasiimunisasi = TextEditingController();
  final namatenagakesehatan = TextEditingController();
  final nomerbatchimunisasi = TextEditingController();
  late String _dropdownMerek;
  late Future<ApiReturnMerek<List<MerekImunisasi>>?> _Merim;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Merim = MerekServices.getMerek(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
        widget.imunisasi!.id.toString());
    context.read<MerekimunisasiCubit>().getMerek(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
        widget.imunisasi!.id.toString());
  }

  void simpan(String tanggal, String merek, String lokasi, String tenaga,
      String batch) async {
    Uri _url = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/imunisasi/create');
    var res = await http.post(
      _url,
      body: {
        'imunisasi_id': widget.imunisasi!.id.toString(),
        'merek': merek,
        'lokasi': lokasi,
        'tenaga_kesehatan': tenaga,
        'nomor_batch': batch,
        'checked_at': tanggal,
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      SimpanDataImunisasi data = SimpanDataImunisasi.fromJson(body['data']);
      Get.to(successimunisasi(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
        widget.imunisasi!.id.toString(),
      ));
    } else {
      throw "Error ${res.statusCode} => ${body["message"]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: 'FF6969'.toColor(),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: 'FFFFFF'.toColor(),
              ),
            ),
            SizedBox(width: 12),
            Text(
              widget.imunisasi!.title ?? '',
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
          padding: EdgeInsets.only(left: 16, right: 16, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Cek',
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: '5A5A5A'.toColor()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: tanggalcek,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: '989797'.toColor(),
                  ),
                  hintText: '10 Januari 2023',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1945),
                      lastDate: DateTime(2500));

                  if (pickeddate != null) {
                    setState(() {
                      tanggalcek.text =
                          DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                'Merek Imunisasi',
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: '5A5A5A'.toColor()),
              ),
              SizedBox(height: 5),
              BlocBuilder<MerekimunisasiCubit, MerekimunisasiState>(
                  builder: (context, snapshot) {
                if (snapshot is MerekLoaded) {
                  if (snapshot.merekImun != null) {
                    return Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: 'B8B8B8'.toColor()),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(border: InputBorder.none),
                        hint: Text(
                          'Imunisasi',
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: '989797'.toColor(),
                          ),
                        ),
                        icon: Icon(
                          Icons.expand_more_outlined,
                          color: 'B8B8B8'.toColor(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _dropdownMerek = value!.toString();
                          });
                        },
                        items: snapshot.merekImun!
                            .map((e) => DropdownMenuItem<String>(
                                  value: e.nama_merek.toString(),
                                  child: Text(e.nama_merek ?? ""),
                                ))
                            .toList(),
                      ),
                    );
                  } else {
                    return Center(
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
              SizedBox(height: 20),
              Text(
                'Lokasi Imunisasi',
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: '5A5A5A'.toColor()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: lokasiimunisasi,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: '989797'.toColor(),
                  ),
                  hintText: 'Opsional',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nama Tenaga Kesehatan',
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: '5A5A5A'.toColor()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: namatenagakesehatan,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: '989797'.toColor(),
                  ),
                  hintText: 'Opsional',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nomer Batch Imunisasi',
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: '5A5A5A'.toColor()),
              ),
              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.number,
                controller: nomerbatchimunisasi,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: '989797'.toColor(),
                  ),
                  hintText: '000318847514',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
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
            simpan(tanggalcek.text, _dropdownMerek, lokasiimunisasi.text,
                namatenagakesehatan.text, nomerbatchimunisasi.text);
            setState(() {
              isLoading = true;
            });
            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                isLoading = false;
              });
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
