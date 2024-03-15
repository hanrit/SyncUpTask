import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GramInsta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = 'https://picsum.photos/id/1015/400/300'; // Replace this with the URL of your desired image
  int likeCount = 0;
  String logoUrl = 'https://picsum.photos/id/1018/50/50'; // Replace this with the URL of your desired logo image
  String chatMessage = '';

  void incrementLikeCount() {
    setState(() {
      likeCount++;
    });
  }

  void sendMessage(String message) {
    setState(() {
      chatMessage = message;
      if (message.toLowerCase() == 'hello') {
        chatMessage = 'Hi there!';
      } else {
        chatMessage = 'Sorry, I don\'t understand.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(logoUrl),
                radius: 20,
              ),
              SizedBox(width: 8),Text('GramInsta'),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Account'),
              Tab(text: 'Chat'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(imageUrl),
                SizedBox(height: 16),
                Text('Likes: $likeCount'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: incrementLikeCount,
                  child: Text('Like'),
                ),
              ],
            ),
            Center(child: Text('Account Tab')),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onSubmitted: (value) {
                      sendMessage(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(chatMessage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}