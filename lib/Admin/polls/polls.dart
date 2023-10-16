// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, prefer_final_fields, avoid_print, prefer_const_constructors, deprecated_member_use
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Polls_admin extends StatefulWidget {
  @override
  _PollsAdminState createState() => _PollsAdminState();
}

class _PollsAdminState extends State<Polls_admin> {
  TextEditingController _questionController = TextEditingController();
  List<TextEditingController> _answerControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

// Create a reference to your Firebase database
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  void _createPoll() {
    try {
      String question = _questionController.text;
      List<String> answers =
          _answerControllers.map((controller) => controller.text).toList();

      if (question.isEmpty) {
        _showError('Please enter the question.');
      } else if (answers.any((answer) => answer.isEmpty)) {
        _showError('Please enter all answers.');
      } else {
        // All fields are filled, proceed to post the poll
        // Save the question
        _database.child('polls').push().set({
          'question': question,
        });

        // Save the answers as "answer1", "answer2", ...
        for (int i = 0; i < answers.length; i++) {
          _database
              .child('polls')
              .child('answers')
              .child('answer${i + 1}')
              .set(answers[i]);
        }

        print('Question: $question');
        print('Answers: $answers');
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('Stack trace: $stackTrace');
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _addAnswer() {
    setState(() {
      _answerControllers.add(TextEditingController());
    });
  }

  void _removeAnswer(int index) {
    setState(() {
      _answerControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Poll',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff453658),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _questionController,
                decoration: InputDecoration(
                  labelText: 'Question',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Answers:'),
              SizedBox(height: 8.0),
              for (int i = 0; i < _answerControllers.length; i++)
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextField(
                          controller: _answerControllers[i],
                          decoration: InputDecoration(
                            labelText: 'Answer ${i + 1}',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    if (i > 1)
                      ElevatedButton(
                        onPressed: () {
                          _removeAnswer(i);
                        },
                        child: Text('Remove'),
                      ),
                  ],
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addAnswer,
                child: Text('Add Answer'),
              ),
              ElevatedButton(
                onPressed: _createPoll,
                child: Text('Post Poll'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
