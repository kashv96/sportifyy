import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifyy/Presentation/GameEvent/game_event_date_time.dart';
import 'package:sportifyy/Presentation/GameEvent/game_location_input.dart';

class OpenGameBottomsheets {
  static Future<void>? showGameLocationInputModal(BuildContext context,
      {Function()? onClosed}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => GameLocationInputBottomSheet(),
    ).then((_) {
      if (onClosed != null) {
        onClosed();
      }
    });
  }

  static Future<void>? showGameEventDateModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => GameEventDateTimeBottomsheet(),
    );
  }
}
