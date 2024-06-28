import 'package:chat_app_task/services/auth/auth_service.dart';
import 'package:chat_app_task/services/chat/chat_services.dart';
import 'package:flutter/material.dart';
import '../widgets/my_chats_container.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  void logOut() async {
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Чаты",
                      style: TextStyle(
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    IconButton(onPressed: logOut, icon: const Icon(Icons.logout)),
                  ],
                ),
                const SizedBox(height: 15),
                searchBar(),
                const SizedBox(height: 10),
                Divider(thickness: 1, color: Theme.of(context).colorScheme.tertiary),
                Expanded(child: _buildUserList()), // Wrap with Expanded
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    var mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: 40,
      width: mediaQuery.size.width * 0.9,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_outlined, color: Theme.of(context).colorScheme.onTertiary),
          hintText: "Поиск",
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: chatService.getUserStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final users = snapshot.data!;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final userData = users[index];
            return _buildUserListItem(userData, context);
          },
        );
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    return MyChatsContainer(
      contactName: userData['contactName'],
      lastMessage: "Hello",
      time: "2 minutes later",
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(
          receiverEmail: userData['contactName'],
        )));
      },
    );
  }
}
