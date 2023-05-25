part of '../pages.dart';

class listAnak extends StatefulWidget {
  BuatDataAnak anak;
  final bool isSelected;
  final ValueChanged<BuatDataAnak>? onChanged;

  listAnak(this.anak, this.isSelected, {this.onChanged});

  @override
  State<listAnak> createState() => _listAnakState();
}

class _listAnakState extends State<listAnak> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.anak.is_active == 1) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = false;
            });

            widget.onChanged!(widget.anak);
          },
          child: Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  (widget.anak.gender == 'Laki-laki')
                      ? (widget.isSelected == true)
                          ? 'assets/laki.png'
                          : 'assets/lakidark.png'
                      : (widget.isSelected == true)
                          ? 'assets/cwe.png'
                          : 'assets/cwedark.png',
                  scale: 2,
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.anak.name ?? '',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: '323232'.toColor(),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.anak.gender ?? '',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: '7A7A7A'.toColor(),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: (widget.isSelected == true)
                              ? 'FF6969'.toColor()
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 1, color: 'A0A0A0'.toColor()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: 'E5E3E3'.toColor()),
      ],
    );
  }
}
