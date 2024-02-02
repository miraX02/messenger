
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messenger/core/extentions.dart';
import '../../core/app_colors.dart';
import '../providers/get_userInfo_id.dart';
import '../screens/chat_screen.dart';


class ChatTile extends ConsumerWidget {
  const ChatTile({
    Key? key,
    required this.userId,
    required this.lastMessage,
    required this.lastMessageTs,
    required this.chatroomId,
  }) : super(key: key);

  final String userId;
  final String lastMessage;
  final DateTime lastMessageTs;
  final String chatroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoByIdProvider(userId));

    return userInfo.when(
      data: (user) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                ChatScreen.routeName,
                arguments: {
                  'userId': userId,
                },
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Text(''),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              lastMessage,
                              style: const TextStyle(
                                color: AppColors.darkGreyColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(' → '),
                          Text(
                            lastMessageTs.jm(),
                            style: const TextStyle(
                              color: AppColors.darkGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Message status
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.check_circle_outline,
                    color: AppColors.messengerDarkGrey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Container(
          width: double.infinity,
          height: 50,
          color: Colors.grey,
          child: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return Container(
          width: double.infinity,
          height: 50,
          color: Colors.grey,
        );
      },
    );
  }
}
