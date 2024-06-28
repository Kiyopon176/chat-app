import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyChatsContainer extends StatelessWidget {
  const MyChatsContainer({
    super.key,
    required this.contactName,
    required this.lastMessage,
    required this.time,
    required this.onTap,
  });


  final void Function()? onTap;
  final String contactName;
  final String lastMessage;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      contactName.substring(0, 2).toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contactName, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        lastMessage,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider(thickness: 1, color: Theme.of(context).colorScheme.tertiary,))
      ],
    );
  }
}
