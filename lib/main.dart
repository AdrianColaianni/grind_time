import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grind_time/models/location.dart';
import 'screens/account.dart';
import 'screens/home.dart';
import 'screens/leaderboard.dart';
import 'screens/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grind Time',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  final _pageOptions = [
    HomeScreen(),
    LeaderboardScreen(),
    MapScreen(),
    AccountScreen()
  ];
  final _pageName = ['Home', 'Leaderboard', 'Map', 'Account'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => LocationService(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pageName[selectedPage]),
            backgroundColor: const Color(0xFFAC0000),
            centerTitle: true,
          ),
          body: _pageOptions[selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30),
                  label: 'Home',
                  backgroundColor: Color(0xFFAC0000)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard, size: 30),
                  label: 'Leaderboard',
                  backgroundColor: Color(0xFFAC0000)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map, size: 30),
                  label: 'Map',
                  backgroundColor: Color(0xFFAC0000)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 30),
                  label: 'Person',
                  backgroundColor: Color(0xFFAC0000))
            ],
            currentIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            backgroundColor: const Color(0xFF222222),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
          ),
          persistentFooterAlignment: AlignmentDirectional.topCenter)
    );
  }
}
