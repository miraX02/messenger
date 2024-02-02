import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error_screen.dart';
import '../../core/loader.dart';
import '../providers/get_allchat_provider.dart';
import 'chat_tile.dart';

class ChatsList extends ConsumerWidget {
  const ChatsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsList = ref.watch(getAllChatsProvider);
    final myUid = FirebaseAuth.instance.currentUser?.uid;

    return chatsList.when(
      data: (chats) {
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats.elementAt(index);
            final userId = chat.members.firstWhere((userId) => userId != myUid);

            return ChatTile(
              userId: userId,
              lastMessage: chat.lastMessage,
              lastMessageTs: chat.lastMessageTs,
              chatroomId: chat.chatroomId,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return ErrorScreen(error: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }
}
