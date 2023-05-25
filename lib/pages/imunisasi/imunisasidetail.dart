part of '../pages.dart';

class imunisasidetail extends StatefulWidget {
  ImunisasiGroup imunisasi;

  imunisasidetail(this.imunisasi);

  @override
  State<imunisasidetail> createState() => _imunisasidetailState();
}

class _imunisasidetailState extends State<imunisasidetail> {
  void reset() async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/imunisasi/reset');
    var res = await http.post(
      url_,
      body: {
        'id': widget.imunisasi.id.toString(),
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      bool data = body["data"];
      Get.to(
          navigation('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4', index: 4));
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
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
              widget.imunisasi.title ?? '',
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              // alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: 165,
              child: Image.network(widget.imunisasi.image ?? '',
                  fit: BoxFit.fitWidth),
            ),
            // Image.asset(widget.imunisasi.image ?? ''),
            SizedBox(height: 16),
            Container(
              // height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(widget.imunisasi.icon ?? '', scale: 1.5),
                      SizedBox(width: 14),
                      Container(
                        // height: 40,
                        width: MediaQuery.of(context).size.width - 93,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.imunisasi.title ?? '',
                                      style: GoogleFonts.poppins().copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: '323232'.toColor(),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: 15,
                                      height: 15,
                                      padding: EdgeInsets.all(2.5),
                                      decoration: BoxDecoration(
                                        // color: '86C3BB'.toColor(),
                                        color:
                                            (widget.imunisasi.is_active == true)
                                                ? '86C3BB'.toColor()
                                                : 'C6C6C6'.toColor(),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(
                                        Icons.done_outlined,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width - 93,
                                  child: Text(
                                    widget.imunisasi.description ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                      color: '7A7A7A'.toColor(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Manfaat',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.imunisasi.manfaat ?? '',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: '7A7A7A'.toColor(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Informasi',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: (widget.imunisasi.informasi != null)
                        ? widget.imunisasi.informasi!
                            .split(' -- ')
                            .map(
                              (e) => Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: '7A7A7A'.toColor(),
                                          size: 8,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                45,
                                        child: Text(
                                          e,
                                          maxLines: 5,
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: '7A7A7A'.toColor(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            )
                            .toList()
                        : [
                            Text(
                              '-',
                              style: GoogleFonts.poppins().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: '7A7A7A'.toColor(),
                              ),
                            ),
                          ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Catatan',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: (widget.imunisasi.catatan != null)
                        ? widget.imunisasi.catatan!
                            .split('--')
                            .map(
                              (e) => Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: '7A7A7A'.toColor(),
                                          size: 8,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                45,
                                        child: Text(
                                          e,
                                          maxLines: 5,
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: '7A7A7A'.toColor(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            )
                            .toList()
                        : [
                            Text(
                              '-',
                              style: GoogleFonts.poppins().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: '7A7A7A'.toColor(),
                              ),
                            ),
                          ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Kontraindikasi',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: (widget.imunisasi.kontra_indikasi != null)
                        ? widget.imunisasi.kontra_indikasi!
                            .split('--')
                            .map(
                              (e) => Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: '7A7A7A'.toColor(),
                                          size: 8,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        // height:
                                        //     MediaQuery.of(context).size.height -
                                        //         620,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                45,
                                        child: Text(
                                          e,
                                          maxLines: 5,
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: '7A7A7A'.toColor(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                            )
                            .toList()
                        : [
                            Text(
                              '-',
                              style: GoogleFonts.poppins().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: '7A7A7A'.toColor(),
                              ),
                            )
                          ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: (Platform.isIOS) ? 80 : 60,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: GestureDetector(
          onTap: () => (widget.imunisasi.is_active == true)
              ? showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Reset Data Imunisasi',
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      content: Text(
                        'Kamu yakin akan menghapus data' + ' ' +
                            widget.imunisasi.title.toString() + ' ' +
                            'si Kecil?',
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
                            style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.bold,
                                color: 'FF6969'.toColor()),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            reset();
                          },
                          child: Text(
                            'Ya',
                            style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.bold,
                                color: 'FF6969'.toColor()),
                          ),
                        ),
                      ],
                    );
                  })
              : Get.to(isidataimunisasi(widget.imunisasi)),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: (widget.imunisasi.is_active == true)
                  ? 'FF6969'.toColor()
                  : '86C3BB'.toColor(),
              // color: '86C3BB'.toColor(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              (widget.imunisasi.is_active == true)
                  ? 'Reset Data Imunisasi'
                  : 'Lengkapi Data Imunisasi',
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
