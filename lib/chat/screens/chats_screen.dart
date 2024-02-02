import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_colors.dart';
import '../widgets/chats_list.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static const routeName = '/chats-screen';

  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildChatsAppBar(),

                const SizedBox(height: 20),

                _buildChatsSearchWidget(),

                const SizedBox(height: 30),

                const SizedBox(
                  height: 600,
                  child: ChatsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatsAppBar() => Row(
        children: [
          const SizedBox(width: 5),
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _buildChatsSearchWidget() => Container(
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.search),
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      );
}
