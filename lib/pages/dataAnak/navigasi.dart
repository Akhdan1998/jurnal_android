part of '../pages.dart';

class navigation extends StatefulWidget {
  String token;
  final int index;

  navigation(this.token, {this.index = 0});

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int _selectedIndex = 0;
  PageController controller = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });

    controller.animateToPage(_selectedIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.index;

    controller = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: (Platform.isIOS)
                ? (MediaQuery.of(context).size.height - 92)
                : (MediaQuery.of(context).size.height - 57),
            width: MediaQuery.of(context).size.width,
            child: PageView(controller: controller, children: [
              Profil(''),
              Tumbuh(''),
              Kembang(''),
              Kehamilan(''),
              imunisasi(''),
            ]),
          ),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: 'FF6969'.toColor(),
            onTap: _navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: 'Profil',
                icon: Image.asset('assets/profil.png', scale: 1.5),
                activeIcon: Image.asset('assets/profilbar.png',
                    color: 'FF6969'.toColor(), scale: 1.5),
              ),
              BottomNavigationBarItem(
                label: 'Tumbuh',
                icon: Image.asset('assets/tumbuh.png', scale: 1.5),
                activeIcon: Image.asset('assets/tumbuhbar.png',
                    color: 'FF6969'.toColor(), scale: 1.5),
              ),
              BottomNavigationBarItem(
                label: 'Kembang',
                icon: Image.asset('assets/kembang.png', scale: 1.5),
                activeIcon: Image.asset('assets/kembangbar.png',
                    scale: 1.5, color: 'FF6969'.toColor()),
              ),
              BottomNavigationBarItem(
                label: 'Kehamilan',
                icon: Image.asset('assets/kehamilan.png', scale: 1.5),
                activeIcon: Image.asset('assets/kehamilanbar.png',
                    scale: 1.5, color: 'FF6969'.toColor()),
              ),
              BottomNavigationBarItem(
                label: 'Imunisasi',
                icon: Image.asset('assets/imunisasi.png', scale: 1.5),
                activeIcon: Image.asset('assets/imunisasibar.png',
                    scale: 1.5, color: 'FF6969'.toColor()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
