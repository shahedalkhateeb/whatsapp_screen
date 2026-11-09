import 'package:flutter/material.dart';

const green = Color(0xFF168C4B);
const grey = Color(0xFF232D36);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsappScreen(),
    ),
  );
}

class WhatsappScreen extends StatelessWidget {
  const WhatsappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),

      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/image_profile.jpg'),
            ),
            SizedBox(width: 8),
            Text(
              'John Safwat',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),          ],
        ),
        actions: [
          Icon(Icons.call),
          SizedBox(width: 16),
          Icon(Icons.videocam_outlined),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/chat_background.png'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(12),
                children: [
                  SizedBox(height: 33),
                  MessageBubble(text: 'Hello !', isMe: false),
                  MessageBubble(text: 'Hello !', isMe: true),
                  MessageBubble(text:
                        'Hey! Have you ever thought about how random '
                        'moments can sometimes turn into the best memories? '
                        'It’s like the universe loves to surprise us when '
                        'we least expect it!',
                    isMe: false,
                  ),
                  MessageBubble(
                    text: 'what a Great Content Tp learn Flutter',
                    isMe: false,
                    image: 'images/route.jpg',
                  ),
                  MessageBubble(
                    text: 'what a Great Content Tp learn Flutter',
                    isMe: true,
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type a Message ...',
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: green),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: green),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: green,
                    child: Icon(Icons.mic, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String image;

  const MessageBubble({super.key,
    required this.text,
    required this.isMe,
    this.image = '',
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 280),
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? grey : green,
          borderRadius: BorderRadius.only(
            topLeft: isMe ? Radius.circular(16) : Radius.zero,
            topRight: isMe ? Radius.zero : Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (image != '')
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    width: 237,
                    height: 171,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
