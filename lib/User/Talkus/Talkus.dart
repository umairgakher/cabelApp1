// ignore_for_file: file_names, library_private_types_in_public_api, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class Talk_service extends StatefulWidget {
  const Talk_service({Key? key}) : super(key: key);

  @override
  _TalkServiceState createState() => _TalkServiceState();
}

class _TalkServiceState extends State<Talk_service> {
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      messages.add('User: $message');
    });

    String adminReply = 'Hy Hope you are Doing well \n How can we assist you?';
    receiveMessage(adminReply);
  }

  void receiveMessage(String message) {
    setState(() {
      messages.add('Admin: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Talk Us',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff392850),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                reverse: true, // Display messages in reverse order
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  String message = messages[index];
                  bool isAdminReply = message.startsWith('Admin:');
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: isAdminReply ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isAdminReply ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String message = messageController.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                      messageController.clear();
                    }
                  },
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
