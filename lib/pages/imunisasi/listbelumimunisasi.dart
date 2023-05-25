part of '../pages.dart';

class listbelumimunisasi extends StatefulWidget {
  ImunisasiGroup imunisasi;

  listbelumimunisasi(this.imunisasi);

  @override
  State<listbelumimunisasi> createState() => _listbelumimunisasiState();
}

class _listbelumimunisasiState extends State<listbelumimunisasi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(imunisasidetail(widget.imunisasi));
      },
      child: Container(
        color: Colors.white,
        // padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
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
                                maxLines: 2,
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
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
                                  color: (widget.imunisasi.is_active == true)
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
                            width: MediaQuery.of(context).size.width - 117,
                            child: Text(
                              widget.imunisasi.description ?? '',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: '7A7A7A'.toColor(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: 'E2E2E2'.toColor(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: 'ECECEC'.toColor()),
          ],
        ),
      ),
    );
  }
}
