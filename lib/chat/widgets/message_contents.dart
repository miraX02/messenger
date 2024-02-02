import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../models/messege.dart';

class MessageContents extends StatelessWidget {
  const MessageContents({
    super.key,
    required this.message,
    this.isSentMessage = false,
  });

  final Message message;
  final bool isSentMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.message,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: isSentMessage ? AppColors.whiteColor : AppColors.blackColor,
      ),
    );
  }
}
