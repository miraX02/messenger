import 'package:flutter/cupertino.dart';
import '../chat/screens/chat_screen.dart';
import '../chat/screens/chats_screen.dart';
import '../core/error_screen.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ChatScreen.routeName:
        final arguments = settings.arguments as Map<String, dynamic>;
        final userId = arguments['userId'] as String;
        return _cupertinoRoute(
          ChatScreen(
            userId: userId,
          ),
        );
      case ChatsScreen.routeName:
        return _cupertinoRoute(
          const ChatsScreen(),
        );
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}