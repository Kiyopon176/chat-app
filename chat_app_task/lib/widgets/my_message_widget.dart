import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({
    super.key,
    required this.timestamp,
    required this.message,
    required this.currentUserMessage,
  });

  final Timestamp timestamp;
  final String message;
  final bool currentUserMessage;

  @override
  Widget build(BuildContext context) {
    DateTime date = timestamp.toDate();
    String formattedDate = DateFormat('HH:mm').format(date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: currentUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: currentUserMessage ? Colors.green : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: currentUserMessage ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            formattedDate,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
