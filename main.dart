import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class User {
  String displayName;
  String uid;

  User({required this.displayName, required this.uid});
}

class Login extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(user: user),
          ),
        );
      }
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to QuizX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _signInAnonymously(context),
              child: Text('Login Anonymously'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final User user;

  QuizScreen({required this.user});

  // Add your quiz logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizX - ${user.displayName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implement your quiz questions and answer buttons here

            ElevatedButton(
              onPressed: () {
                // Check the answer and update score
              },
              child: Text('Submit Answer'),
            ),
          ],
        ),
      ),
    );
  }
}

class Scoreboard extends StatelessWidget {
  final int score;
  final int highScore;

  Scoreboard({required this.score, required this.highScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoreboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score: $score'),
            Text('High Score: $highScore'),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  // Implement chat screen UI and logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implement chat messages and input field here
          ],
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  // Implement notification screen UI and logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implement notification messages here
          ],
        ),
      ),
    );
  }
}
