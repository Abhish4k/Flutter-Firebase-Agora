import 'package:flutter/material.dart';

enum AppBarActionType { notification, chat, edit, back, custom }

class AppBarAction {
  final AppBarActionType type;
  final String? customTitle;
  final VoidCallback? customAction;

  const AppBarAction({required this.type, this.customTitle, this.customAction});

  String get actionTitle {
    switch (type) {
      case AppBarActionType.notification:
        return 'Notification';
      case AppBarActionType.chat:
        return 'Chat';
      case AppBarActionType.edit:
        return 'Edit';
      case AppBarActionType.back:
        return 'Back';
      case AppBarActionType.custom:
        return customTitle ?? 'Custom';
    }
  }

  VoidCallback? get action {
    switch (type) {
      case AppBarActionType.notification:
        return () {
          print('Notification action triggered');
          // Add notification logic here
        };
      case AppBarActionType.chat:
        return () {
          print('Chat action triggered');
          // Add chat logic here
        };
      case AppBarActionType.edit:
        return () {
          print('Edit action triggered');
          // Add edit logic here
        };
      case AppBarActionType.back:
        return () {
          print('Back action triggered');
          // Add back logic here
        };
      case AppBarActionType.custom:
        return customAction;
    }
  }
}
