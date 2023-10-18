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
    String adminReply = generateResponse(message);
    receiveMessage(adminReply);
  }

  void receiveMessage(String message) {
    setState(() {
      messages.add('Admin: $message');
    });
  }

  String generateResponse(String message) {
    // Perform analysis on the user's message and generate a response based on the issue
    if (message.contains('internet problem')) {
      return 'Please check your internet connection.';
    } else if (message.contains('cable issue ')) {
      return 'We apologize for the cable issue. Our technician will be in touch with you shortly.';
    } else if (message.contains('signal issue')) {
      return 'Please make sure your cable signal is strong and properly connected.';
    } else if (message.contains('channels issue')) {
      return 'If you are experiencing issues with specific channels, please try rescanning for channels or contact our support team for further assistance.';
    } else if (message.contains('picture')) {
      return 'If you are experiencing issues with the picture quality, please check your cable connections and ensure your TV settings are properly configured.';
    } else if (message.contains('billing')) {
      return 'For any billing-related queries, please contact our billing department at [phone number] or visit our website for more information.';
    } else if (message.contains('outage')) {
      return 'If there is a known outage in your area, our team is already working on resolving it. We appreciate your patience.';
    } else if (message.contains('remote')) {
      return 'If you are having trouble with your cable remote, please try replacing the batteries or contact our support team for further assistance.';
    } else if (message.contains('installation')) {
      return 'If you need assistance with cable installation, please schedule an appointment with our installation team.';
    } else if (message.contains('HD channels')) {
      return 'To access HD channels, make sure you have an HD cable box and a subscription to HD services.';
    } else if (message.contains('On-Demand')) {
      return 'To access On-Demand content, please make sure your cable box is connected to the internet and you have an active subscription.';
    } else if (message.contains('DVR')) {
      return 'If you are experiencing issues with your DVR, please try restarting it or contact our support team for further assistance.';
    } else if (message.contains('programming guide')) {
      return 'If you have trouble navigating the programming guide, please refer to the user manual or contact our support team for guidance.';
    } else if (message.contains('channel lineup')) {
      return 'To view our channel lineup, please visit our website or contact our customer service for a detailed list.';
    } else if (message.contains('service outage')) {
      return 'If you are experiencing a service outage, please check our website or social media channels for any reported outages in your area.';
    } else if (message.contains('cable box')) {
      return 'If your cable box is not responding, please try unplugging it for a few seconds and then plugging it back in. If the issue persists, contact our support team.';
    } else if (message.contains('subscription package')) {
      return 'To upgrade or modify your subscription package, please visit our website or contact our customer service for assistance.';
    } else if (message.contains('payment options')) {
      return 'We offer various payment options including online payments, automatic bill pay, and payment centers. Visit our website for more information.';
    } else if (message.contains('channel not available')) {
      return 'If a specific channel is not available, it may not be included in your subscription package. Please check your channel lineup or contact our customer service for further assistance.';
    } else if (message.contains('how to talk with admin')) {
      return 'Please call Support at:0333-222828';
    } else {
      return 'Thank you for contacting us. We will assist you shortly.';
    }
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
                reverse: true,
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
