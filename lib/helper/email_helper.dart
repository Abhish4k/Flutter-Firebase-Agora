import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';

class EmailHelper {
  /// Check if email exists in Firebase Authentication
  /// Returns true if email exists, false otherwise
  static Future<bool> checkEmailExists(String email) async {
    try {
      List<String> methods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(email);
      bool exists = methods.isNotEmpty;
      DataHelper.logValue("Email check", "Email $email exists: $exists");
      return exists;
    } catch (e) {
      DataHelper.logValue("Email check error", e.toString());
      return false;
    }
  }

  /// Validate email format
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Check if email exists and is valid
  static Future<Map<String, dynamic>> validateAndCheckEmail(
    String email,
  ) async {
    Map<String, dynamic> result = {
      'isValid': false,
      'exists': false,
      'message': '',
    };

    // First check if email format is valid
    if (!isValidEmail(email)) {
      result['message'] = 'Please enter a valid email address';
      return result;
    }

    result['isValid'] = true;

    // Then check if email exists in Firebase
    bool exists = await checkEmailExists(email);
    result['exists'] = exists;

    if (exists) {
      result['message'] = 'Email already exists';
    } else {
      result['message'] = 'Email is available';
    }

    return result;
  }
}
