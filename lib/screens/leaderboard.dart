import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
