import 'package:chat_app_task/services/auth/auth_service.dart';
import 'package:chat_app_task/services/chat/chat_services.dart';
import 'package:chat_app_task/widgets/my_message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverId,
  });

  final String receiverEmail;
  final String receiverId;
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Text(
                receiverEmail.substring(0, 2).toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(receiverEmail),
                Text(
                  'В сети',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(), // Placeholder for the message list
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessages(receiverId, senderId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    return MyMessageWidget(
      timestamp: data['timestamp'], // assuming your timestamp is stored as a Timestamp in Firestore
      message: data["message"],
      currentUserMessage: isCurrentUser,
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.photo_camera, color: Theme.of(context).colorScheme.onTertiary),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Сообщение',
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mic, color: Theme.of(context).colorScheme.onTertiary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Theme.of(context).colorScheme.primary),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
