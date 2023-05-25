part of '../pages/pages.dart';

class kategori extends StatefulWidget {
  late final Milestones_category? kategorimilestone;

  kategori(this.kategorimilestone);

  @override
  State<kategori> createState() => _kategoriState();
}

class _kategoriState extends State<kategori> {
  List<List<Color>> listColor2 = [
    ['86C3BB'.toColor(), '679E97'.toColor()], //background, button [0]
    ['81B1DE'.toColor(), '3F719F'.toColor()], //background, button [1]
    ['DE8ECD'.toColor(), 'B15C9F'.toColor()], //background, button [2]
    ['E9A47D'.toColor(), 'BC7B57'.toColor()], //background, button [3]
    //[0]                [1]
  ];

  Color? buttonColor, backgroundColor;
  double total_percent = 0;
  double pencapaian_percent = 0;
  double total_pencapaian_percent = 0;

  @override
  Widget build(BuildContext context) {
    //indikator
    pencapaian_percent = widget.kategorimilestone!.pencapaian!.toDouble(); //0
    total_pencapaian_percent =
        widget.kategorimilestone!.total_pencapaian!.toDouble(); //7

    double item_satuan = 1.00 / total_pencapaian_percent;

    total_percent = pencapaian_percent * item_satuan;
    int percent = (total_percent * 100).toInt();

    //motorik_background
    Color bcg_motorik = listColor2[0][0];
    Color btn_motorik = listColor2[0][1];

    //bahasa_background
    Color bcg_bahasa = listColor2[1][0];
    Color btn_bahasa = listColor2[1][1];

    //sosial_background
    Color bcg_sosial = listColor2[2][0];
    Color btn_sosial = listColor2[2][1];

    //kognitif_background
    Color bcg_kogintif = listColor2[3][0];
    Color btn_kognitif = listColor2[3][1];

    if (widget.kategorimilestone!.title == "Motorik Kasar & Halus") {
      backgroundColor = bcg_motorik;
      buttonColor = btn_motorik;
    }
    if (widget.kategorimilestone!.title == "Bahasa") {
      backgroundColor = bcg_bahasa;
      buttonColor = btn_bahasa;
    }
    if (widget.kategorimilestone!.title == "Sosial & Emosional") {
      backgroundColor = bcg_sosial;
      buttonColor = btn_sosial;
    }
    if (widget.kategorimilestone!.title == "Kognitif") {
      backgroundColor = bcg_kogintif;
      buttonColor = btn_kognitif;
    }

    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: (Platform.isIOS)
                  ? ((MediaQuery.of(context).size.width - 2 * 15) / 2 - 10)
                  : (MediaQuery.of(context).size.width - 205),
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 12, top: 12),
                    child: Image.asset(
                        widget.kategorimilestone!.icon_path ?? '',
                        scale: 1.5),
                  ),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.kategorimilestone!.title ?? '',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: 'FFFFFF'.toColor()),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.kategorimilestone!.pencapaian.toString() ??
                                  '',
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: 'FFFFFF'.toColor()),
                            ),
                            SizedBox(width: 3),
                            Text(
                              '/',
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: 'FFFFFF'.toColor()),
                            ),
                            SizedBox(width: 3),
                            Text(
                              widget.kategorimilestone!.total_pencapaian
                                      .toString() ??
                                  '',
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: 'FFFFFF'.toColor()),
                            ),
                            SizedBox(width: 3),
                            Text(
                              'Pencapaian',
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: 'FFFFFF'.toColor()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(bottom: 11, right: 12),
                    child: LinearPercentIndicator(
                      width: (Platform.isIOS)
                          ? ((MediaQuery.of(context).size.width - 2 * 15) / 2 -
                              48)
                          : (MediaQuery.of(context).size.width - 243),
                      lineHeight: 7,
                      percent: total_percent,
                      barRadius: Radius.circular(20),
                      progressColor: buttonColor,
                      backgroundColor: 'FFFFFF'.toColor(),
                      trailing: Text(
                        percent.toString() + '%',
                        style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: 'FFFFFF'.toColor()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: (Platform.isIOS)
                  ? ((MediaQuery.of(context).size.width - 2 * 15) / 2 - 10)
                  : (MediaQuery.of(context).size.width - 205),
              height: 25,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.kategorimilestone!.title ?? '',
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: (Platform.isIOS) ? 11 : 9,
                                  fontWeight: FontWeight.bold,
                                  color: '323232'.toColor()),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.kategorimilestone!.pencapaian
                                          .toString() ??
                                      '',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: (Platform.isIOS) ? 10 : 8,
                                      fontWeight: FontWeight.w300,
                                      color: '939393'.toColor()),
                                ),
                                SizedBox(width: (Platform.isIOS) ? 3 : 2),
                                Text(
                                  '/',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: (Platform.isIOS) ? 10 : 8,
                                      fontWeight: FontWeight.w300,
                                      color: '939393'.toColor()),
                                ),
                                SizedBox(width: (Platform.isIOS) ? 3 : 2),
                                Text(
                                  widget.kategorimilestone!.total_pencapaian
                                          .toString() ??
                                      '',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: (Platform.isIOS) ? 10 : 8,
                                      fontWeight: FontWeight.w300,
                                      color: '939393'.toColor()),
                                ),
                                SizedBox(width: (Platform.isIOS) ? 3 : 2),
                                Text(
                                  'Pencapaian',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: (Platform.isIOS) ? 10 : 8,
                                      fontWeight: FontWeight.w300,
                                      color: '939393'.toColor()),
                                ),
                              ],
                            ),
                          ],
                        ),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.kategorimilestone!.todolist
                                .map((e) => pertanyaanTes(
                                    widget.kategorimilestone!.milestones_id!,
                                    e))
                                .toList()),
                      );
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (Platform.isIOS)
                      ? ((MediaQuery.of(context).size.width - 2 * 15) / 2 - 10)
                      : (MediaQuery.of(context).size.width - 205),
                  height: 40,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Mulai Tes',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: 'FFFFFF'.toColor(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 100,
          child: Image.asset(
            'assets/efek.png',
            scale: 1.1,
          ),
        ),
      ],
    );
  }
}
