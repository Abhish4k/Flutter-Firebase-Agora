import 'package:flutter/widgets.dart';
import 'package:flutter_agora_video_call/utils/app_text_style.dart';

extension HightlightedText on Text {
  Text boldSubString({
    required String target,
    required double fontSize,
    required TextAlign align,
    required Color textColor,
    required Color highLightColor,
    required FontWeight fontWeight,
  }) {
    final textSpans = List.empty(growable: true);
    final escapedTarget = RegExp.escape(target);
    final pattern = RegExp(escapedTarget, caseSensitive: false);
    final matches = pattern.allMatches(data!);

    int currentIndex = 0;
    for (final match in matches) {
      final beforeMatch = data!.substring(currentIndex, match.start);
      if (beforeMatch.isNotEmpty) {
        textSpans.add(
          TextSpan(
            text: beforeMatch,
            style: appTextStyle(
              fontSize: fontSize + 1,
              colour: textColor,
              height: 1.5,
            ),
          ),
        );
      }

      final matchedText = data!.substring(match.start, match.end);
      textSpans.add(
        TextSpan(
          text: matchedText,
          style: appTextStyle(
            fontSize: fontSize + 1,
            colour: highLightColor,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < data!.length) {
      final remainingText = data!.substring(currentIndex);
      textSpans.add(
        TextSpan(
          text: remainingText,
          style: appTextStyle(
            fontSize: fontSize + 1,
            colour: textColor,
            height: 1.5,
            fontWeight: fontWeight,
          ),
        ),
      );
    }

    return Text.rich(
      TextSpan(children: <TextSpan>[...textSpans]),
      textAlign: align,
    );
  }
}
