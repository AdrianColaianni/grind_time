import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
	final _pageName = [
		'Home',
		'Leaderboard',
		'Map',
		'Account'
	];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
					title: Text(_pageName[selectedPage]),
					backgroundColor: const Color(0xFFAC0000),
					centerTitle: true,
					),
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
					type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
							icon: Icon(Icons.home, size: 30),
							label: 'Home',
							// backgroundColor: Color(0xFFAC0000)
						),
            BottomNavigationBarItem(
							icon: Icon(Icons.leaderboard, size:30),
							label: 'Leaderboard',
							// backgroundColor: Color(0xFFAC0000)
						),
            BottomNavigationBarItem(
							icon: Icon(Icons.map, size:30),
							label: 'Map',
							// backgroundColor: Color(0xFFAC0000)
						),
            BottomNavigationBarItem(
							icon: Icon(Icons.person, size:30),
							label: 'Person',
							// backgroundColor: Color(0xFFAC0000)
						)
          ],
					currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
					backgroundColor: const Color(0xFF222222),
					selectedItemColor: const Color(0xFFAC0000)
        ),
        persistentFooterAlignment: AlignmentDirectional.topCenter);
  }
}

///////////////////////////////////////////////////////////
// Home Screen
///////////////////////////////////////////////////////////

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home screen!'));
  }
}

///////////////////////////////////////////////////////////
// Leaderboard Screen
///////////////////////////////////////////////////////////

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
	final _leaderboard = generateWordPairs().take(40).toList();
	// _leaderboard.addAll(generateWordPairs().take(15));

  @override
  Widget build(BuildContext context) {
		return ListView.builder(
			itemBuilder: (context, i) {
				return ListTile(
					title: Text(_leaderboard[i].asPascalCase),
				);},
				itemCount: _leaderboard.length
		);
  }
}

///////////////////////////////////////////////////////////
// Map Screen
///////////////////////////////////////////////////////////

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Map Screen!'));
  }
}

///////////////////////////////////////////////////////////
// Account Screen
///////////////////////////////////////////////////////////

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Accout Screen!'));
  }
}
