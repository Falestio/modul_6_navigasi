import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HalamanBeranda(),
      ),
      GoRoute(
        path: '/jelajah',
        builder: (BuildContext context, GoRouterState state) => HalamanJelajah(),
      ),
      GoRoute(
        path: '/akun',
        builder: (BuildContext context, GoRouterState state) => HalamanAkun(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Praktikum Navigasi',
      routerConfig: _router, // Updated here
    );
  }
}

class HalamanBeranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum Navigasi'),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Penting: Hilangkan semua padding dari ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/03/Logo_Telkom_University_potrait.png')
                  )
                ]
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Lihat Koleksi'),
              onTap: () => context.go('/jelajah'),
            ),
            ListTile(
              leading: Icon(Icons.man_3),
              title: Text('Akun'),
              onTap: () => context.go('/akun'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Ini adalah tampilan Halaman Beranda'),
      ),
    );
  }
}

class HalamanJelajah extends StatefulWidget {
  @override
  _HalamanJelajahState createState() => _HalamanJelajahState();
}

class _HalamanJelajahState extends State<HalamanJelajah> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    GayaPakaianGrid(gaya: 'Formal'),
    GayaPakaianGrid(gaya: 'Kasual'),
    GayaPakaianGrid(gaya: 'Vintage'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Koleksi'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Formal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style), // Changed icon
            label: 'Kasual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'Vintage',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class GayaPakaianGrid extends StatelessWidget {
  final String gaya;

  const GayaPakaianGrid({Key? key, required this.gaya}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 10, // Jumlah item dalam grid
      itemBuilder: (BuildContext context, int index) {
        return Image.asset('assets/nasigoreng.jpeg');
      },
    );
  }
}

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Akun'),
      ),
      body: Center(
        child: Text('Ini adalah tampilan Halaman Akun'),
      ),
    );
  }
}
